//
//  CustomProgressStyle.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import SwiftUI

struct CustomProgressStyle: ProgressViewStyle {
 
    var fillColor: Color = .purple
    var unfilledColor: Color = .purple
    var height: Double = 20.0
 
    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0
 
        HStack() {
            RoundedRectangle(cornerRadius: height / 2)
                .fill(unfilledColor.opacity(0.5))
                .frame(height: height)
                .frame(width: .infinity)
                .overlay(alignment: .leading) {
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: height / 2)
                            .fill(fillColor)
                            .frame(height: height)
                            .frame(width: geometry.size.width * progress)
                            .overlay {
                                if let currentValueLabel = configuration.currentValueLabel {
                                    currentValueLabel
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            }
                    }
                }
        }
        
    }
}
