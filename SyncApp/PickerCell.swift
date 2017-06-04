//
//  PickerCell.swift
//  SyncApp
//
//  Created by Jing Si on 4/19/17.
//  Copyright © 2017 Jing Si. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell {
    @IBOutlet weak var picker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
