//
//  TableViewImageCell.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/07.
//

import UIKit

class TableViewImageCell: UITableViewCell {
    
    var url : String?

    @IBOutlet weak var shopImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shopImage.image = UIImage(url: "https://imgfp.hotp.jp/IMGH/43/78/P039454378/P039454378_168.jpg")
    }
}
