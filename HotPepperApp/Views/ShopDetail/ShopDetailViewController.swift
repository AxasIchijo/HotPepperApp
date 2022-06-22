//
//  ShopDetailViewController.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/02.
//

import UIKit

class ShopDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let shopDetailDataSource = ShopDetailDataSource()
    
    public var shopName: String?;
    
    public var id: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        title = shopName
        if let shopDetail = ShopInfoDataService.shared.getShopDetail(id: id!) {
            shopDetailDataSource.tableData = shopDetail.detailList
        } else {
            print("shop detail not found")
        }
        
        tableView.delegate = self
        tableView.dataSource = shopDetailDataSource
        tableView.register(UINib(nibName: "TableViewImageCell", bundle: nil), forCellReuseIdentifier: "TableViewImageCell")
        tableView.register(UINib(nibName: "ShopDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopDetailTableViewCell")
    }
}

// テーブルビューの処理
extension ShopDetailViewController: UITableViewDelegate {
}
