//
//  MatchResults.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import Foundation

typealias MatchResults = [MatchResult]

// MARK: - MatchResult
struct MatchResult : Codable {
    var games: [Game]?
    var id: Int?
    var league: League?
    var leagueID: Int?
    var live: Live?
    var name: String?
    var numberOfGames: Int?
    var opponents: [Opponent]?
    var scheduledAt: Date?
    var serie: Serie?
    var serieID: Int?
    var slug: String?
    var status: Status?
    var winner: OpponentClass?
    var winnerID: Int?
    var winnerType: String?
    
    enum CodingKeys: String, CodingKey {
        case games
        case id
        case league
        case leagueID = "league_id"
        case live
        case name
        case numberOfGames = "number_of_games"
        case opponents
        case scheduledAt = "scheduled_at"
        case serie
        case serieID = "serie_id"
        case slug
        case status
        case winner
        case winnerID = "winner_id"
        case winnerType = "winner_type"
        }
    
}

// MARK: - Game
struct Game : Codable{
    var beginAt: Date?
    var complete, detailedStats: Bool?
    var endAt: Date?
    var finished, forfeit: Bool?
    var id: Int?
    var length: Int?
    var matchID, position: Int?
    var status: Status?
    var winner: GameWinner?
    var winnerType: String?
    
    enum CodingKeys: String, CodingKey {
            case beginAt = "begin_at"
            case complete
            case detailedStats = "detailed_stats"
            case endAt = "end_at"
            case finished, forfeit, id, length
            case matchID = "match_id"
            case position, status, winner
            case winnerType = "winner_type"
        }
}

enum Status: String, Codable {
    case finished = "finished"
    case notStarted = "not_started"
    case canceled = "canceled"
    case postponed = "postponed"
    case running = "running"
}

// MARK: - GameWinner
struct GameWinner: Codable {
    var id: Int?
    var type: String?
}


// MARK: - League
struct League : Codable{
    var id: Int?
    var imageURL: String?
    var name: String?
    var slug: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
            case id
            case imageURL = "image_url"
            case name, slug, url
        }
}

// MARK: - Live

// MARK: - Opponent
struct Opponent : Codable{
    var opponent: OpponentClass?
    var type: String?
}

// MARK: - OpponentClass
struct OpponentClass :Codable{
    var id: Int?
    var imageURL: String?
    var location: String?
    var name, slug: String?
    
    enum CodingKeys: String, CodingKey {
           case id
           case imageURL = "image_url"
           case location
           case name, slug
       }
}


// MARK: - Serie
struct Serie : Codable{
    var beginAt: String?
    var endAt: String?
    var fullName: String?
    var id, leagueID: Int?
    var name: String?
    var season: String?
    var slug: String?
    var year: Int?
    
    enum CodingKeys: String, CodingKey {
            case beginAt = "begin_at"
            case endAt = "end_at"
            case fullName = "full_name"
            case id
            case leagueID = "league_id"
            case name, season, slug
            case year
        }
}
// MARK: - Live
struct Live: Codable {
    var opensAt: String?
    var supported: Bool?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case opensAt = "opens_at"
        case supported, url
    }
}
