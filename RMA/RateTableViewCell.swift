//
//  RateTableViewCell.swift
//  RMA
//
//  Created by CIS Student on 11/4/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class RateTableViewCell: UITableViewCell {
    @IBOutlet weak var ratedAcronyms: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var definitionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
