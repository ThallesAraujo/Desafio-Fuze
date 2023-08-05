//
//  TeamResults.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import Foundation
import Foundation

typealias TeamResults = [TeamResult]

struct TeamResult: Codable {
    var acronym: String?
    var currentVideogame: CurrentVideogame?
    var id: Int?
    var imageURL: String?
    var location: String?
    var modifiedAt: Date?
    var name: String?
    var players: [Player]?
    var slug: String?

    enum CodingKeys: String, CodingKey {
        case acronym
        case currentVideogame = "current_videogame"
        case id
        case imageURL = "image_url"
        case location
        case modifiedAt = "modified_at"
        case name, players, slug
    }
}

// MARK: - CurrentVideogame
struct CurrentVideogame: Codable {
    var id: Int?
    var name, slug: String?
}

// MARK: - Player
struct Player: Codable {
    var age: Int?
    var birthday: String?
    var firstName: String?
    var id: Int?
    var imageURL: String?
    var lastName: String?
    var modifiedAt: Date?
    var name, nationality: String?
    var role: String?
    var slug: String?

    enum CodingKeys: String, CodingKey {
        case age, birthday
        case firstName = "first_name"
        case id
        case imageURL = "image_url"
        case lastName = "last_name"
        case modifiedAt = "modified_at"
        case name, nationality, role, slug
    }
}
