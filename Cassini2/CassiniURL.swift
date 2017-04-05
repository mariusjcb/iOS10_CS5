//
//  PhotoAPI.swift
//  CassiniCS5
//
//  Created by Marius Ilie on 04/04/17.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import Foundation

class CassiniURL {
    private static let NASA = [
        "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
        "Curiosity" : "https://www.nasa.gov/sites/default/files/thumbnails/image/pia19142_malhi-mojave.jpg",
        "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg",
        "Bucharest" : "http://blog.parkinn.com/wp-content/uploads/sites/7/2015/10/BP1-BUHPD-Shutterstock-The-Romanian-capital-of-Bucharest-is-a-fantastic-place-to-live-as-an-expat.jpg"
    ]
    
    static func NASAImage(named: String?) -> URL? {
        if let URLString = named {
            return URL(string: NASA[URLString] ?? "")
        } else {
            return nil
        }
    }
}
