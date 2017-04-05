//
//  CassiniViewController.swift
//  Cassini2
//
//  Created by Marius Ilie on 05/04/17.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destinationvc = segue.destination as? ImageViewController {
            destinationvc.imageURL = CassiniURL.NASAImage(named: segue.identifier)
            destinationvc.title = (sender as? UIButton)?.currentTitle
        }
    }
}
