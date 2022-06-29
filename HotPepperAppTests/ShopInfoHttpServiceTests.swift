//
//  TestShopInfoDataService.swift
//  HotPepperApp
//
//  Created by AXLT0221-AP on 2022/06/27.
//

import XCTest
@testable import HotPepperApp

// 通信後の処理をモック化
class MockHttpSessionDataTask: HttpSessionDataTask {
    private (set) var called = false
    func resume() {
        called = true
    }
}

// 通信処理をモック化
class MockHttpSession: HttpSession {
    private (set) var called = false
    
    var dataTask = MockHttpSessionDataTask()
    
    func http(url: URL, completion: @escaping DataTaskResult) -> HttpSessionDataTask {
        called = true
        return dataTask
    }
}

class ShopInfoHttpServiceTests: XCTestCase {
    
    let session = MockHttpSession()
    var service: ShopInfoHttpService!

    override func setUpWithError() throws {
        service = ShopInfoHttpService(session: self.session, url: "xxx")
    }

    override func tearDownWithError() throws {
    }

    func testGet() throws {
        session.dataTask = MockHttpSessionDataTask()
        
        service.get(controller: UIViewController())
        
        XCTAssertTrue(session.called)
        XCTAssertTrue(session.dataTask.called)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
