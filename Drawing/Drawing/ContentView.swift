//
//  ContentView.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/18/23.
//

import SwiftUI



struct ContentView: View {
   
    
    var body: some View {
        VStack {
            FlowerView()
            
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 100)
                
            Arc(startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
                .strokeBorder(.purple, lineWidth: 10)
                .frame(width: 100, height: 100)
            
            Circle()
                .strokeBorder(.blue, lineWidth: 20)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
