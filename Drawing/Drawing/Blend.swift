//
//  Blend.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/18/23.
//

import SwiftUI

struct Blend: View {
    @State private var amount = 0.0
    
    var body: some View {
        //            Image("corn-1")
        //                .resizable()
        //                .scaledToFill()
        //                .colorMultiply(.green)
        
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                Circle()
                    .fill(.yellow)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct Blend_Previews: PreviewProvider {
    static var previews: some View {
        Blend()
            .preferredColorScheme(.dark)
    }
}
