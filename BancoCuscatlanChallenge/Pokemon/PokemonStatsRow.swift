//
//  PokemonStatsRow.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import SwiftUI

struct PokemonStatsRow: View {
    
    @State var pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Estadísticas")
                .bold()
                .font(.system(size: 24))
                .foregroundColor(Color.Blue4)
            
            ForEach(pokemon.stats) { item in
                HStack {
                    Text(item.stat.name)
                    
                    ProgressView(
                        value: Double(item.base_stat),
                        total: 150
                    )
                    .tint(Color.Yellow2)
                    .background(Color.Yellow1)
                    
                    Text("\(item.base_stat)")
                }
            }
        }
        .padding()
    }
}

struct PokemonStatsRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsRow(
            pokemon: ModelData().dummyPokemon
        )
    }
}
