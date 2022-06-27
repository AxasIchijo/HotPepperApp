//
//  ShopInfo.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/12.
//

struct HttpShopInfoEntity: Codable {
    var results: Results
}

struct Results: Codable {
    var shop: [Shop]
}

struct Shop: Codable {
    
    // list
    var id: String
    var photo: Photo
    var name: String
    var genre: Genre
    var address: String
    var privateRoom: String
    var card: String
    var nonSmoking: String
    
    // detail
    var access: String
    var course: String
    var freeDrink: String
    var freeFood: String
    var horigotatsu: String
    var tatami: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case photo
        case name
        case genre
        case address
        case privateRoom = "private_room"
        case card
        case nonSmoking = "non_smoking"
        
        case access
        case course
        case freeDrink = "free_drink"
        case freeFood = "free_food"
        case horigotatsu
        case tatami
    }
    
    struct Photo: Codable {
        var mobile: ImageAssortment
        
        struct ImageAssortment: Codable {
            var l: String
            var s: String
        }
    }

    struct Genre: Codable {
        var name: String
    }
}
