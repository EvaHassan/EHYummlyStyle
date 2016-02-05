//
//  Int+NumberFormatter.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 2/4/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import Foundation

extension Int {
    func format() -> String {
        //
        let numbFormatter = NSNumberFormatter()
        numbFormatter.numberStyle = .DecimalStyle
        numbFormatter.maximumFractionDigits = 1
        numbFormatter.roundingMode = .RoundDown
        let selfDouble = Double(self)
        //
        if self < 1000 {
            return "\(self)"
        } else if self < 100000 {
            
            numbFormatter.multiplier = NSNumber(double: 0.001)
            let s = numbFormatter.stringFromNumber(selfDouble)!
            return s+"k"
        
        } else {
            numbFormatter.numberStyle = .DecimalStyle
            numbFormatter.maximumFractionDigits = 1
            numbFormatter.roundingMode = .RoundDown
            numbFormatter.multiplier = NSNumber(double: 0.000001)
            let s = numbFormatter.stringFromNumber(selfDouble)!
            return s+"M"
        }
    }
}
