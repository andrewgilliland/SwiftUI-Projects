//
//  TrapezoidView.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/19/23.
//

import SwiftUI

struct TrapezoidView: View {
    @State private var insetAmount = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)                    
                }
            }
    }
}

struct TrapezoidView_Previews: PreviewProvider {
    static var previews: some View {
        TrapezoidView()
            .preferredColorScheme(.dark)
    }
}
