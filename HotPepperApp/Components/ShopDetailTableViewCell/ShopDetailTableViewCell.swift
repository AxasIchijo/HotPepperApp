//
//  ShopDetailTableViewCell.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/06.
//

import UIKit

class ShopDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
