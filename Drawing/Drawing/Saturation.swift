//
//  Saturation.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/19/23.
//

import SwiftUI

struct SaturationView: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("corn-1")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
        }
        .ignoresSafeArea()
    }
}

struct Saturation_Previews: PreviewProvider {
    static var previews: some View {
        SaturationView()
            .preferredColorScheme(.dark)
    }
}
