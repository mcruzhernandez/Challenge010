//
//  PokemonView.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import SwiftUI

struct PokemonView: View {
    
    @State var pokemon: Pokemon
    @State var pokemonSpecies: PokemonSpecies
    
    var body: some View {
        VStack {
            PokemonRow(pokemon: pokemon, pokemonSpecies: pokemonSpecies)
            PokemonStatsRow(pokemon: pokemon)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(
            pokemon: ModelData().dummyPokemon,
            pokemonSpecies: ModelData().dummyPokemonSpecies
        )
    }
}
