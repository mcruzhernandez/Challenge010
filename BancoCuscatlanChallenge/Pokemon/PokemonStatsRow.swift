//
//  PokemonStatsRow.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import SwiftUI

struct PokemonStatsRow: View {
    
    @State var pokemon: Pokemon
    @State var pokemonSpecies: PokemonSpecies
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Estadísticas")
                .bold()
                .font(.system(size: 24))
                .foregroundColor(Color.Blue4)
            
            ForEach(pokemon.stats) { item in
                HStack(alignment: .center) {
                    Text(item.stat.name)
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.Gray5)
                    
                    ProgressView(value: Double(item.base_stat), total: 150)
                        .frame(height: 22)
                        .progressViewStyle(
                            CustomProgressStyle(
                                fillColor: Color.findCustomColor(color: pokemonSpecies.color.name),
                                unfilledColor: Color.findCustomColor(color: pokemonSpecies.color.name),
                                height: 22)
                        )
                    
                    Text("\(item.base_stat)")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.Gray5)
                }
            }
        }
        .padding()
    }
}

struct PokemonStatsRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsRow(
            pokemon: ModelData().dummyPokemon,
            pokemonSpecies: ModelData().dummyPokemonSpecies
        )
    }
}
