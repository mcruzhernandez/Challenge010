//
//  PokedexView.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/4/23.
//

import SwiftUI
import Alamofire

struct PokedexView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var pokedex = Pokedex()
    @State var searchText: String = ""
    
    var columnGrid: [GridItem] = Array(
        repeating: .init(.flexible()), count: 2
    )
    
    var body: some View {
        NavigationView {
            VStack {
                // search textbar
                VStack {
                    TextField(" Search", text: $searchText)
                        .frame(height: 60.0)
                        .border(.white, width: 0.5)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom)
                        .foregroundColor(.white)
                }
                .background(.teal)
                
                // Main body
                ScrollView {
                    LazyVGrid(columns: columnGrid) {

                        ForEach(
                            pokedex.pokemon_entries.filter {
                                searchText.isEmpty ||
                                $0.pokemon_species.name.localizedCaseInsensitiveContains(searchText) ||
                                $0.entry_number == Int(searchText)
                            }
                        ) { pokemon in
                            PokedexRow(
                                pokemon: Pokemon(
                                    id: pokemon.entry_number
                                )
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.all)
                }
                
                
            }
            .onAppear(perform: loadPokedex)
            .background(
                Color(
                    red: 248 / 255,
                    green: 248 / 255,
                    blue: 248 / 255
                )
            )
        }
    }
    
    func loadPokedex() {
        AF.request(ApiRouter.pokedex(region: "2"))
            .validate()
            .responseDecodable(of: Pokedex.self) { response in
                switch response.result {
                case .success(let pokedex):
                    print(pokedex)
                    self.pokedex = pokedex
                default:
                    print(response.error)
                    break
                }
            }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView(pokedex: ModelData().dummyPokedex)
            .environmentObject(ModelData())
    }
}
