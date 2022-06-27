//
//  ViewShopDetailEntity.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/12.
//

struct ViewShopDetailEntity {
    var id: String
    var detailList: [Detail]
    
    struct Detail {
    var title: String
    var value: String
    var order: Int
    }
}


enum ShopDetailItem: CaseIterable {
    case photo(title: String, order: Int)
    case genre(title: String, order: Int)
    case access(title: String, order: Int)
    case address(title: String, order: Int)
    case course(title: String, order: Int)
    case freeDrink(title: String, order: Int)
    case freeFood(title: String, order: Int)
    case privateRoom(title: String, order: Int)
    case horigotatsu(title: String, order: Int)
    case tatami(title: String, order: Int)
    case card(title: String, order: Int)
    
    static var allCases: [ShopDetailItem] {
        return [
            .photo(title: "", order: 0),
            .genre(title: "ジャンル", order: 1),
            .access(title: "交通アクセス", order: 2),
            .address(title: "住所", order: 3),
            .course(title: "コース", order: 4),
            .freeDrink(title: "飲み放題", order: 5),
            .freeFood(title: "食べ放題", order: 6),
            .privateRoom(title: "個室", order: 7),
            .horigotatsu(title: "掘りごたつ", order: 8),
            .tatami(title: "座敷", order: 9),
            .card(title: "カード可", order: 10),
        ]
    }
}
