//
//  TeamResults.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import Foundation
import Foundation

typealias TeamResults = [TeamResult]

// MARK: - TeamResult
struct TeamResult: Codable {
    var id: Int?
    var imageURL: String?
    var location: String?
    var name: String?
    var players: [Player]?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case location
        case name, players
    }
}


// MARK: - Player
struct Player: Codable {
    var age: Int?
    var birthday, firstName: String?
    var id: Int?
    var imageURL: String?
    var lastName: String?
    var modifiedAt: Date?
    var name: String?
    var nationality: String?
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


