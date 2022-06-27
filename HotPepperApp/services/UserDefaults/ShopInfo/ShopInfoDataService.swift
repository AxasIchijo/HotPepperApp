//
//  ShopInfoDataService.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/12.
//

import Foundation

final class ShopInfoDataService {
    
    static let shared = ShopInfoDataService()
    
    var publisher = NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification)
    
    private let key = "shop_info"
    
    // singleton
    private init() {}
    
    /* 店舗情報保存 */
    public func setShopInfo(shopInfo: [Shop]) -> Void {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(shopInfo) else {
            print("error: save shopInfo")
            return
        }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    /* 店舗一覧情報取得 */
    public func getShopList() -> [ViewShopListEntity] {
        let shopInfo = getShopInfoList()
        
        let shopList = shopInfo.map() { ViewShopListEntity.init(id: $0.id, photo: $0.photo.mobile.s, name: $0.name, genre: $0.genre.name, address: $0.address, privateRoom: $0.privateRoom, card: $0.card, nonSmoking: $0.nonSmoking) }
        
        return shopList
    }
    
    /* 店舗詳細情報取得 */
    public func getShopDetail(id: String) -> ViewShopDetailEntity? {
        let shopInfo = getShopInfoList()
        if let shop = shopInfo.find(operation: { $0.id == id }) {
            let shopDetail = ViewShopDetailEntity.init(id: shop.id, detailList: ShopDetailItem.allCases.map() { v in
                switch v {
                case let ShopDetailItem.photo(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.photo.mobile.l, order: order)
                case let ShopDetailItem.genre(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.genre.name, order: order)
                case let ShopDetailItem.access(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.access, order: order)
                case let ShopDetailItem.address(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.address, order: order)
                case let ShopDetailItem.course(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.course, order: order)
                case let ShopDetailItem.freeDrink(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.freeDrink, order: order)
                case let ShopDetailItem.freeFood(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.freeFood, order: order)
                case let ShopDetailItem.privateRoom(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.privateRoom, order: order)
                case let ShopDetailItem.horigotatsu(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.horigotatsu, order: order)
                case let ShopDetailItem.tatami(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.tatami, order: order)
                case let ShopDetailItem.card(title, order):
                    return ViewShopDetailEntity.Detail(title: title, value: shop.card, order: order)
                }
            })
            return shopDetail
        }
        return nil
    }
    
    /* 店舗情報取得 */
    private func getShopInfoList() -> [Shop] {
        let jsonDecoder = JSONDecoder()
        
        guard let data = UserDefaults.standard.data(forKey: key),
              let shopInfoList = try? jsonDecoder.decode([Shop].self, from: data) else {
                  return []
              }
        return shopInfoList
    }
}
