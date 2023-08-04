//
//  PokeApi.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation

struct Pokedex: Codable {
    var id: Int = 0
    var name: String = ""
    var pokemon_entries: [PokemonEntry] = [PokemonEntry]()
}

struct PokemonEntry: Codable {
    var entry_number: Int = 0
    var pokemon_species: PokemonEntrySpecies = PokemonEntrySpecies()
}

struct PokemonEntrySpecies: Codable {
    var name: String = ""
    var url: String = ""
}
