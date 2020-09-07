//
//  Task4Tests.swift
//  Task4Tests
//
//  Created by Elizaveta Shabalina on 07.09.2020.
//  Copyright © 2020 Elizaveta Shabalina. All rights reserved.
//

import XCTest
@testable import Task4

class Task4Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let viewController = ViewController()
        
        // symbols used tests
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: "a123"), true, "login `a123` is valid")
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: "123@"), false, "login `123@` is invalid")
        
        // sybmols count tests
        XCTAssertEqual(viewController.isCountOfSymbolsValid(login: "df"), false, "login `df` is invalid")
        XCTAssertEqual(viewController.isCountOfSymbolsValid(login: "df323"), true, "login `df323` is valid")
        XCTAssertEqual(viewController.isCountOfSymbolsValid(login: String(repeating: "a", count: 32)), true, "login with 32 symbols is valid")
        XCTAssertEqual(viewController.isCountOfSymbolsValid(login: String(repeating: "a", count: 33)), false, "login with more than 32 symbols is invalid")
        
        // spetial symbols tests
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: "test-test"), true, "login `test-` is valid")
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: "test.test"), true, "login `test.test` is valid")
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: "test%test"), false, "login `test%test` is invalid")
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: "-test"), false, "login should not start with -")
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: ".test"), false, "login should not start with .")
        XCTAssertEqual(viewController.isLoginSymbolsValid(login: "0test"), false, "login should not start with 0")
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
