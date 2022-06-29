//
//  HttpSession.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/29.
//

import Foundation

typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol HttpSession {
    func http(url: URL, completion: @escaping DataTaskResult) -> HttpSessionDataTask
}

extension URLSession: HttpSession {
    func http(url: URL, completion: @escaping DataTaskResult) -> HttpSessionDataTask {
        return dataTask(with: url, completionHandler: completion)
    }
}
