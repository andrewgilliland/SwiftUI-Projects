//
//  ColorCyclingCircle.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/18/23.
//

import Foundation
import SwiftUI

struct ColorCyclingCircleView: View {
    @State private var amount = 0.0
    let steps = 100
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<steps, id: \.self) { value in
                    Circle()
                        .inset(by: Double(value))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    color(for: value, brightness: 1),
                                    color(for: value, brightness: 0.5)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 2
                    )
                }
            }
            .drawingGroup()
            
            Slider(value: $amount)
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct CyclingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingCircleView()
            .preferredColorScheme(.dark)
    }
}
