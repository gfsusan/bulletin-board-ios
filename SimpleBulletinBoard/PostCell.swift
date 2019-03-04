//
//  PostCell.swift
//  SimpleBulletinBoard
//
//  Created by Susan Kim on 04/03/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
