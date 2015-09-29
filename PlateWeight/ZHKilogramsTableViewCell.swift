//
//  ZHKilogramsTableViewCell.swift
//  PlateWeight
//
//  Created by Zakk Hoyt on 9/29/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import UIKit

class ZHKilogramsTableViewCell: UITableViewCell {

    var pounds: Double = 0{
        didSet{
            poundsLabel.text = NSString(format: "%.2f", pounds) as String
            let kilograms = ZHConverter.poundsToKilograms(pounds)
            kilogramsLabel.text = NSString(format: "%.2f", kilograms) as String
        }
    }
    
    var kilograms: Double = 0{
        didSet{
            kilogramsLabel.text = NSString(format: "%.2f", kilograms) as String
            let pounds = ZHConverter.kilogramsToPounds(kilograms)
            poundsLabel.text = NSString(format: "%.2f", pounds) as String
        }
    }
    
    @IBOutlet weak var kilogramsLabel: UILabel!
    @IBOutlet weak var poundsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
