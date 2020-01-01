//
//  PlayerTests.swift
//  HastenSportsTests
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import HastenSports
@testable import SDWebImage
class PlayerTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }
    
    // MARK: - Init

    func test_Init_GivenFirstname_SetsFirstname() {
        let randomFirstname = UUID().description
        
        let sut = playerWith(firstname: randomFirstname)
        
        XCTAssertEqual(randomFirstname, sut.firstname)
    }
    
    func test_Init_GivenLastname_SetsLastname() {
        let randomLastname = UUID().description
        
        let sut = playerWith(lastname: randomLastname)
        
        XCTAssertEqual(randomLastname, sut.lastname)
    }
    
    func test_Init_GivenImageUrl_SetsImageUrl() {
        let randomImageUrl = UUID().description
        
        let sut = playerWith(imageUrl: randomImageUrl)
        
        XCTAssertEqual(randomImageUrl, sut.imageUrl)
    }
    
    func test_Init_GivenJSON_DecodesCorrectly() {
        let player = try? JSONDecoder().decode(Player.self, from: jsonPlayer())
        
        XCTAssertNotNil(player, "could not decode JSON player")
    }
    
    // MARK: - Helpers
    
    private func playerWith(
        firstname: String = UUID().description,
        lastname: String = UUID().description,
        imageUrl: String = UUID().description) -> Player {
        
        return Player(firstname: firstname, lastname: lastname, imageUrl: imageUrl)
    }
    
    private func jsonPlayer() -> Data {
        let jsonString = """
        {
            "image": "http://www.segundoasegundo.com/sas/wp-content/uploads/2014/01/cristiano-ronaldo.jpg",
            "surname": "Ronaldo",
            "name": "Cristiano"
        }
        """
        return jsonString.data(using: .utf8)!
    }
}
