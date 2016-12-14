//
//  RateHeaderTableViewCell.swift
//  RMA
//
//  Created by CIS Student on 11/4/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class RateHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var RateHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red: 109/255, green: 121/255, blue: 255/255, alpha: 1/1)
    }
}
