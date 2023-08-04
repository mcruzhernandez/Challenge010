//
//  Pokemon.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation

struct Pokemon: Codable {
    var name: String = ""
    var image: String = ""
}

struct PokemonSpecieInformation: Codable {
    var height: Int
    var weight: Int
    var types: [PokemonType]
    var sprites: PokemonSprite
}

struct PokemonType: Codable {
    var slot: Int
    var type: PokemonTypeInformation
}

struct PokemonTypeInformation: Codable {
    var name: String
}

struct PokemonSprite: Codable {
    var back_default: String
    var front_default: String
}
