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
        switch CellType.getType(row: indexPath.row, length: self.tableData.count) {
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewImageCell", for: indexPath ) as? TableViewImageCell else {
                return UITableViewCell()
            }
            cell.shopImage.image = UIImage(url: tableData[indexPath.row].value)
            return cell
        case .detail:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopDetailTableViewCell", for: indexPath ) as? ShopDetailTableViewCell else {return UITableViewCell() }
            cell.titleLabel.text = tableData[indexPath.row].title
            cell.detailLabel.text = tableData[indexPath.row].value
            return cell
        default:
            return UITableViewCell()
        }
    }
}
