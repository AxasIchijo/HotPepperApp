//
//  ShopListTableViewCell.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/04.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {

    @IBOutlet weak var shopImage: UIImageView!
    
    @IBOutlet weak var shopName: UILabel!
    
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var otherInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
