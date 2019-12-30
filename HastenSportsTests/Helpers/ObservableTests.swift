//
//  ObservableTests.swift
//  HastenSportsTests
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import HastenSports
class ObservableTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }

    // MARK: - Init
    
    func test_Init_GivenValue_SetsValue() {
        let randomString = UUID().description
        
        let sut = stringObservable(withValue: randomString)
        
        XCTAssertEqual(randomString, sut.value)
    }
    
    // MARK: - Bind
    
    func test_Bind_WhenBinded_GetsNotified() {
        let randomString = UUID().description
        
        let expectation = XCTestExpectation(description: "Initial value is notified")
        
        let sut = stringObservable(withValue: randomString)
        sut.bind { value in
            XCTAssertEqual(randomString, value)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_Bind_WhenValueChanges_GetsNotified() {
        let randomString = UUID().description
        
        let expectation = XCTestExpectation(description: "Changed value is notified")
        
        let sut = stringObservable(withValue: randomString)
        var notificationsCount = 0
        sut.bind { value in
            notificationsCount += 1
            if notificationsCount == 2 {
                XCTAssertNotEqual(randomString, value)
                expectation.fulfill()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 1...4)) {
            sut.value = UUID().description
        }
        
        wait(for: [expectation], timeout: 5)
    }

    // MARK: - Helpers
    
    private func stringObservable(
        withValue value: String = UUID().description) -> Observable<String> {
        return Observable<String>(value: value)
    }
}
