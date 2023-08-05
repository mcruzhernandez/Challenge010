//
//  PokemonRow.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import NukeUI
import SwiftUI

struct PokemonRow: View {
    
    @State var pokemon: Pokemon
    @State var pokemonSpecies: PokemonSpecies
    
    var body: some View {
        VStack {
            LazyImage(url: URL(string: pokemon.sprites.front_default))
                .aspectRatio(240.0, contentMode: .fit)
                .frame(width: 265.0, height: 230.0)
            Text(pokemon.types[0].type.name)
            
            HStack {
                
                HStack {
                    Image("Pokedex")
                    VStack {
                        Text("\(pokemon.weight)")
                        Text("Peso")
                    }
                }
                
                HStack {
                    Image("Pokedex")
                    VStack{
                        Text("\(pokemon.height)")
                        Text("Altura")
                    }
                }
                
            }
            
            Text(pokemonSpecies.flavor_text_entries[0].flavor_text)
                .frame(maxWidth: .infinity)
                
        }
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRow(
            pokemon: ModelData().dummyPokemon,
            pokemonSpecies: ModelData().dummyPokemonSpecies
        )
    }
}
