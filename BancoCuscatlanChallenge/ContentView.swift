//
//  ContentView.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PokedexView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
