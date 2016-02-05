//
//  yumlyModel.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 2/3/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import Foundation

struct Cities {
    
    static let sharedInstance = Cities()
    
    var cities = [City]()
    
    private init() {
        let path = NSBundle.mainBundle().pathForResource("cities", ofType: "plist")
        
        if let path = path {
            if let citiesArray = NSArray.init(contentsOfFile: path) as? [[String: AnyObject]] {
                cities = citiesArray.map{City(dictionary: $0 as [String:AnyObject])}
            }
        }
    }
}


class City {
    let name : String
    let imageName: String
    var isLiked : Bool
    var ratingCount: Int
    let landmarks: [String]
    
    
    init(dictionary :[String: AnyObject]) {
        name = dictionary["name"] as? String ?? ""
        imageName = dictionary["imageName"] as? String ?? ""
        isLiked = dictionary["isLiked"] as? Bool ?? false
        ratingCount = dictionary["ratingCount"] as? Int ?? 0
        landmarks = dictionary["landmarks"] as? [String] ?? []
    }
}