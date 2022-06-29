//
//  ShopDetailCellType.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/27.
//

enum CellType: Int {
    case image,
         detail,
         noData
    
    static func getType(row: Int, length: Int) -> CellType {
        guard length > 0 else {
            return .noData
        }
        
        if(row == 0) {
            return .image
        } else {
            return .detail
        }
        
    }
}
