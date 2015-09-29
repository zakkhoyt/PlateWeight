//
//  ZHConverter.swift
//  PlateWeight
//
//  Created by Zakk Hoyt on 9/29/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import Foundation


class ZHConverter {
    class func poundsToKilograms(pounds: Double) -> Double{
        return pounds * 0.453592
    }
    
    class func kilogramsToPounds(kilograms: Double) -> Double{
        return kilograms / 0.453592
    }
}

