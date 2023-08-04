//
//  ModelData.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/4/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var dummyPokedex: Pokedex = load("DummyPokedex.json")
    @Published var dummyPokemon: Pokemon = load("DummyPokemon.json")
    @Published var dummyPokemonSpecies: PokemonSpecies = load("DummyPokemonSpecies.json")
    
    @Published var pokedex: Pokedex = Pokedex()
    @Published var pokemon: Pokemon = Pokemon()
    @Published var pokemonSpecies: PokemonSpecies = PokemonSpecies()
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
