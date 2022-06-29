//
//  HttpSessionDataTask.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/29.
//

import Foundation

protocol HttpSessionDataTask {
    func resume()
}

extension URLSessionDataTask: HttpSessionDataTask {
}
