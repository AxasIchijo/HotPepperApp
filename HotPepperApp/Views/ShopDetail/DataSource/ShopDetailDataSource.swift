//
//  ShopDetailDataSource.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/06.
//

import UIKit

class ShopDetailDataSource: NSObject,  UITableViewDataSource {
    
    var tableData: [ViewShopDetailEntity.Detail] = []
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 自作セルを返却
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewImageCell", for: indexPath ) as! TableViewImageCell
            cell.shopImage.image = UIImage(url: tableData[indexPath.row].value)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopDetailTableViewCell", for: indexPath ) as! ShopDetailTableViewCell
            cell.titleLabel.text = tableData[indexPath.row].title
            cell.detailLabel.text = tableData[indexPath.row].value
            return cell
        }
    }
}
