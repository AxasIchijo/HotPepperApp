//
//  CollectionType.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/12.
//

extension Array {
    func find(operation: @escaping (Self.Element) -> Bool) -> Self.Element? {
        if let i = firstIndex(where: operation) {
            return self[i]
        }
        return nil
    }
}
