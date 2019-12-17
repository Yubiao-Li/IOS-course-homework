//
//  FoodTableViewCell.swift
//  第四次作业——outlet
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 Mei.class5.edu. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel?
    @IBOutlet weak var detailLable: UILabel?
    
    @IBOutlet weak var foodAvatarView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
