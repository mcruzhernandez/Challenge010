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

struct PokemonStats: Codable {
    var base_stat: Int = 0
    var stat: PokemonStat = PokemonStat()
}

struct PokemonStat: Codable {
    var name: String = ""
}

struct PokemonType: Codable {
    var type: PokemonTypeInformation = PokemonTypeInformation()
}

struct PokemonTypeInformation: Codable {
    var name: String = ""
}
