//
//  PlayersGroupTests.swift
//  HastenSportsTests
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import HastenSports
class PlayersGroupTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }

    // MARK: - Init
    
    func test_Init_GivenName_SetsName() {
        let randomName = UUID().description
        
        let sut = playersGroupWith(name: randomName)
        
        XCTAssertEqual(randomName, sut.name)
    }
    
    func test_Init_GivenSomePlayers_AddPlayersToPlayersList() {
        let randomPlayers = someRandomPlayers()
        
        let sut = playersGroupWith(players: randomPlayers)
        
        XCTAssertEqual(randomPlayers.count, sut.players.count)
        for player in randomPlayers {
            XCTAssertNotNil(sut.players.firstIndex(where: { $0 == player }))
        }
    }
    
    func test_Init_GivenNoPlayer_SetsEmptyPlayerList() {
        let sut = playersGroupWith()
        
        XCTAssertEqual(0, sut.players.count)
    }
    
    func test_Init_GivenJSON_DecodesCorrectly() {
        let playersGroup = try? JSONDecoder().decode(PlayersGroup.self, from: jsonPlayersGroup())
        
        XCTAssertNotNil(playersGroup, "could not decode JSON players group")
    }
    
    // MARK: - Helpers
    
    private func playersGroupWith(
        name: String = UUID().description,
        players: [Player]? = nil) -> PlayersGroup {
        
        return PlayersGroup(name: name, players: players)
    }
    
    private func someRandomPlayers() -> [Player] {
        var players = [Player]()
        
        for _ in 1...Int.random(in: 1...10) {
            players.append(randomPlayer())
        }
        
        return players
    }
    
    private func randomPlayer() -> Player {
        return Player(firstname: UUID().description, lastname: UUID().description, imageUrl: UUID().description)
    }
    
    private func jsonPlayersGroup() -> Data {
        let jsonString = """
        {
          "players": [
            {
              "image": "http://www.lanuevanoticia.com/wp-content/uploads/2013/11/Sebastian-Vettel.jpg",
              "surname": "Vettel",
              "name": "Sebastian"
            },
            {
              "image": "http://caracteres.mx/wp-content/uploads/2013/03/Fernando-alonso.jpg",
              "surname": "Alonso",
              "name": "Fernando"
            },
            {
              "image": "http://www.eldesmarqueasturias.com/images/stories/201314/Formula_Uno/Hamilton.jpg",
              "surname": "Hamilton",
              "name": "Lewis"
            }
          ],
          "type": "GRID",
          "title": "Formula 1"
        }
        """
        return jsonString.data(using: .utf8)!
    }
}
