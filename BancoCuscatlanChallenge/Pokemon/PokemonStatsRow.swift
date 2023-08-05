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
        VStack(alignment: .leading) {
            Text("Estadísticas")
                .bold()
                .font(.system(size: 24))
                .foregroundColor(Color.Blue4)
            
            ForEach(pokemon.stats) { item in
                
                
                HStack {
                    Text(item.stat.name)
                        .frame(minWidth: 150, alignment: .leading)
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.Gray5)
                    
                    ProgressView(value: Double(item.base_stat), total: 150)
                        .frame(height: 16)
                        .progressViewStyle(
                            CustomProgressStyle(
                                fillColor: Color.findCustomColor(color: pokemonSpecies.color.name),
                                unfilledColor: Color.findCustomColor(color: pokemonSpecies.color.name),
                                height: 16)
                        )
                    
                    Text("\(item.base_stat)")
                        .frame(minWidth: 40, alignment: .trailing)
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
