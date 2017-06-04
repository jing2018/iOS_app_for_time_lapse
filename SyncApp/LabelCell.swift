//
//  LabelCell.swift
//  SyncApp
//
//  Created by Jing Si on 4/19/17.
//  Copyright © 2017 Jing Si. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {
    @IBOutlet weak var leftlabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
