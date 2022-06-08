//
//  ShopListViewController.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/05/30.
//

import UIKit

class ShopListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let shopListDataSource = ShopListDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "東京都の店舗一覧"
        tableView.delegate = self
        tableView.dataSource = shopListDataSource
        tableView.register(UINib(nibName: "ShopListTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopListTableViewCell")
    }
}

// テーブルビューの処理
extension ShopListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shopDetailViewController = ShopDetailViewController()
        shopDetailViewController.shopName = shopListDataSource.tableData[indexPath.row];
        // 店舗詳細へ遷移
        self.navigationController?.pushViewController(shopDetailViewController, animated:false)
    }
}
