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
            VStack(alignment: .leading) {
                
                // Header
                HStack {
                    Image("Pokedex")
                        .frame(width: 46.0, height: 46.0)
                        .padding(.leading)
                    
                    Text("Pokédex")
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(Color.Blue3)
                        .padding(.leading, 5)
                }
                
                
                Group {
                    Text("¡Hola, ").fontWeight(.medium)
                    +
                    Text("bienvenido!").bold()
                }
                .font(.system(size: 24))
                .foregroundColor(Color.Blue4)
                .padding(.top)
                .padding(.leading)
                
                // search textbar
                ZStack(alignment: .trailing) {
                    
                    Circle()
                        .fill(Color.Yellow2)
                        .frame(width: 32.0, height: 32.0)
                        .padding(.trailing, 20)
                        .overlay(
                            Image("Search")
                                .padding(.trailing, 20)
                        )
                    
                    TextField("Search", text: $searchText)
                        .frame(height: 44.0)
                        .foregroundColor(Color.Gray5)
                        .padding(.leading)
                        .padding(.leading)
                        .padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22.0)
                                .stroke(Color.Gray3, lineWidth: 1.0)
                                .padding(.leading)
                                .padding(.trailing)
                        )
                    
                }
                
                
                // Main body
                ScrollView {
                    LazyVGrid(columns: columnGrid) {

                        ForEach(
                            pokedex.pokemon_entries.filter {
                                searchText.isEmpty ||
                                $0.pokemon_species.name.localizedCaseInsensitiveContains(searchText) ||
                                "#\($0.entry_number)" == searchText
                            }
                        ) { pokemon in
                            PokedexRow(
                                pokemon: Pokemon(id: pokemon.entry_number)
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.all)
                }
                
                
            }
            .onAppear(perform: loadPokedex)
            .background(Color.Gray1)
            .padding(EdgeInsets())
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
