//
//  ShopListViewController.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/05/30.
//

import UIKit
import Combine

class ShopListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let shopListDataSource = ShopListDataSource()
    
    var canncelable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        ShopInfoHttpService().get(controller: self)
        navigationItem.title = "東京都の店舗一覧"
        tableView.delegate = self
        tableView.dataSource = shopListDataSource
        tableView.register(UINib(nibName: "ShopListTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopListTableViewCell")
        
        // データ更新検知
        canncelable = ShopInfoDataService.shared.publisher.sink(receiveValue: { _ in
            DispatchQueue.main.async {[weak self] in
                guard let strongSelf = self else { return }
                                strongSelf.tableView.reloadData()
                strongSelf.shopListDataSource.tableData = ShopInfoDataService.shared.getShopList()
                strongSelf.tableView.reloadData()
            }
        })
    }
    
    deinit {
        canncelable?.cancel()
    }
}

// テーブルビューの処理
extension ShopListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shopDetailViewController = ShopDetailViewController()
        shopDetailViewController.shopName = shopListDataSource.tableData[indexPath.row].name;
        shopDetailViewController.id = shopListDataSource.tableData[indexPath.row].id;
        // 店舗詳細へ遷移
        self.navigationController?.pushViewController(shopDetailViewController, animated:false)
    }
}
