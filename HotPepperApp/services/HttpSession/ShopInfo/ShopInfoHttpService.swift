//
//  ShopInfoHttpService.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/16.
//

import Foundation
import UIKit

struct ShopInfoHttpService {
    let url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1"
    let queryParams: Dictionary<String, String> = ["key": key, "large_area": "Z011","format": "json"]
    
    func get(controller: UIViewController) -> Void {
        let request = url + getQuery(params: queryParams)
        URLSession.shared.dataTask(with: URL(string: request)!) { data, response, error in
            guard let d = data else { return }
            
            if (error != nil) {
                controller.present(errorDialog(controller: controller), animated: true, completion: nil)
            }
            
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let shopInfo: HttpShopInfoEntity = try decoder.decode(HttpShopInfoEntity.self, from: d)
                
                ShopInfoDataService.shared.setShopInfo(shopInfo: shopInfo.results.shop)
            } catch let e {
                print("JSON Decode Error :\(e)")
                fatalError()
            }
        }.resume()
    }
    
    func getQuery(params: Dictionary<String,String>) -> String {
        var query = "?"
        query += params.map({ $0.key + "=" + $0.value }).joined(separator: "&")
        return query
    }
    
    func errorDialog(controller: UIViewController) -> UIAlertController {
        // ダイアログ生成
        let alertController = UIAlertController(title: "通信エラー", message: "通信に失敗しました。\n再度取得しますか？", preferredStyle: UIAlertController.Style.alert)
        
        // OKボタン追加
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (action: UIAlertAction) in
            get(controller: controller)
        }
        alertController.addAction(okAction)
        
        // キャンセルボタン追加
        let cancelButton = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        
        return alertController
    }
}
