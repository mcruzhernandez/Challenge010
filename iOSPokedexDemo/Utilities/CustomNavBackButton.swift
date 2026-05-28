//
//  CustomNavBackButton.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import SwiftUI

struct NavBackButton: View {
    let dismiss: DismissAction
    let pokemonName: String
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("ArrowBack")
            Text(pokemonName)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.Blue4)
        }
    }
}
