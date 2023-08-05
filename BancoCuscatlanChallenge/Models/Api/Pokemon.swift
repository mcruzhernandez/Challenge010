//
//  Pokemon.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation

struct Pokemon: Codable {
    var id = 0
    var name = ""
    var height: Int = 0
    var weight: Int = 0
    var types: [PokemonType] = [PokemonType]()
    var sprites: PokemonSprite = PokemonSprite()
    var stats: [PokemonStats] = [PokemonStats]()
}

struct PokemonSprite: Codable {
    var front_default: String = ""
}

struct PokemonStats: Codable, Identifiable {
    let id = UUID()
    var base_stat: Int = 0
    var stat: PokemonStat = PokemonStat()
    
    enum CodingKeys: String, CodingKey {
        case base_stat
        case stat
    }
}

struct PokemonStat: Codable {
    var name: String = ""
}

struct PokemonType: Codable, Identifiable {
    let id = UUID()
    var type: PokemonTypeInformation = PokemonTypeInformation()
    
    enum CodingKeys: String, CodingKey {
        case type
    }
}

struct PokemonTypeInformation: Codable {
    var name: String = ""
}
