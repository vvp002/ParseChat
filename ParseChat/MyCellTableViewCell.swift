//
//  MyCellTableViewCell.swift
//  ParseChat
//
//  Created by Vivian Pham on 2/23/17.
//  Copyright © 2017 Vivian Pham. All rights reserved.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var messsageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
