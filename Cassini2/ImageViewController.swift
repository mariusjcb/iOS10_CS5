//
//  ImageViewController.swift
//  Cassini2
//
//  Created by Marius Ilie on 05/04/17.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInteractive).async {
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents, url == self.imageURL {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    func onDoubleTapOrLongPress() {
        if scrollView.zoomScale == scrollView.maximumZoomScale {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else if scrollView.zoomScale == scrollView.minimumZoomScale {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.addSubview(imageView)
            
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
            
            scrollView.contentSize = imageView.frame.size
            
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(onDoubleTapOrLongPress))
            doubleTap.numberOfTapsRequired = 2
            
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(onDoubleTapOrLongPress))
            
            scrollView.addGestureRecognizer(doubleTap)
            scrollView.addGestureRecognizer(longPress)
        }
    }
    
    fileprivate var imageView = UIImageView()
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            
            scrollView?.contentSize = imageView.frame.size
            
            spinner?.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
}

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
