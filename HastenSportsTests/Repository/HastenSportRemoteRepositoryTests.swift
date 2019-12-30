//
//  HastenSportRemoteRepositoryTests.swift
//  HastenSportsTests
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import HastenSports
class HastenSportRemoteRepositoryTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }
    
    // MARK: - FetchPlayers
    
    func test_FetchPlayers_UsesProperUrlString() {
        let spyNetworkingService = SpyNetworkingService()
        let sut = HastenSportsRemoteRepository(networkingService: spyNetworkingService)
        
        let expectation = XCTestExpectation(description: "Finish API call")
        sut.fetchPlayers { _ in
            let expectedApiUrlString = "https://api.myjson.com/bins/66851"
            XCTAssertEqual(expectedApiUrlString, spyNetworkingService.apiUrlString)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_FetchPlayers_ReturnsPlayers() {
        let dummyNetworkingService = SpyNetworkingService(jsonString: dummyJSONString)
        let sut = HastenSportsRemoteRepository(networkingService: dummyNetworkingService)
        
        let expectation = XCTestExpectation(description: "Finish API call")
        sut.fetchPlayers { result in
            switch result {
            case .success(let groups):
                XCTAssertEqual(1, groups.count)
                XCTAssertEqual(1, groups.first?.players.count)
            case .failure:
                XCTFail()
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}

// MARK: - Spies, stubs, dummies

private var dummyJSONString: String {
    return """
    [
        {
          "players": [
            {
              "image": "http://www.lanuevanoticia.com/wp-content/uploads/2013/11/Sebastian-Vettel.jpg",
              "surname": "Vettel",
              "name": "Sebastian"
            }
          ],
          "type": "GRID",
          "title": "Formula 1"
        }
    ]
    """
}

private class SpyNetworkingService: NetworkingService {
    
    // MARK: - Properties
    
    var apiUrlString: String = ""
    
    private let jsonString: String
    
    // MARK: - Initialization
    
    init(jsonString: String = "") {
        self.jsonString = jsonString
    }
    
    // MARK: - Implementation
    
    override func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
        apiUrlString = urlString
        
        if let result = try? JSONDecoder().decode(T.self, from: jsonString.data(using: .utf8)!) {
            completion(.success(result))
        } else {
            completion(.failure(NSError()))
        }
    }
}
