//
//  FlowerView.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/18/23.
//

import SwiftUI

struct FlowerView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Spacer()
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.yellow, style: FillStyle(eoFill: true))
                .frame(width: 100, height: 100)
            Spacer()
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
            Spacer()
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView()
            .preferredColorScheme(.dark)
    }
}
