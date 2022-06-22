//
//  ShopListDataSource.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/05.
//

import UIKit
import Combine

class ShopListDataSource: NSObject,  UITableViewDataSource {
    
    var tableData: [ViewShopListEntity] = []
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 自作セルを返却
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListTableViewCell", for: indexPath ) as! ShopListTableViewCell
        
        cell.shopImage.image = UIImage.init(url: tableData[indexPath.row].photo) 
        cell.shopName.text = tableData[indexPath.row].name
        cell.address.text = tableData[indexPath.row].address
        cell.genre.text = tableData[indexPath.row].genre
        cell.otherInfo.text = tableData[indexPath.row].privateRoom + "、" + tableData[indexPath.row].card + "、" + tableData[indexPath.row].nonSmoking
        return cell
    }
}
