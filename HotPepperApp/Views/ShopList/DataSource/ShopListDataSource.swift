//
//  ShopListDataSource.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/05.
//

import UIKit

class ShopListDataSource: NSObject,  UITableViewDataSource {
    
    let tableData = ["1", "2", "3", "4", "5"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 自作セルを返却
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListTableViewCell", for: indexPath ) as! ShopListTableViewCell

        cell.shopName.text = tableData[indexPath.row]
        return cell
    }
}
