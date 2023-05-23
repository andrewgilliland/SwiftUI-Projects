//
//  ContentView.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/18/23.
//

import SwiftUI



struct ContentView: View {
   
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink {
                        ColorCyclingCircleView()
                            .frame(width: 100, height: 100)
                    } label: {
                        Text(".drawingGroup()")
                    }
                        
                    NavigationLink {
                        FlowerView()
                    } label: {
                        Text("Flower")
                    }
                    
                    NavigationLink {
                        Text("Hola!")
                            .frame(width: 70, height: 50)
                            .border(.red, width: 10)
                    } label: {
                        Text("Border")
                    }
                    
                    NavigationLink {
                        Triangle()
                            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .frame(width: 100, height: 100)
                    } label: {
                        Text("Triangle")
                    }
                    
                    NavigationLink {
                        Arc(startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
                            .strokeBorder(.purple, lineWidth: 10)
                            .frame(width: 100, height: 100)
                    } label: {
                        Text("Arc")
                    }
                    
                    NavigationLink {
                        Circle()
                            .strokeBorder(.blue, lineWidth: 20)
                            .frame(width: 100, height: 100)
                    } label: {
                        Text(".strokeBorder()")
                    }
                    
                    NavigationLink {
                        SaturationView()
                    } label: {
                        Text("Saturation + Blur")
                    }
                    
                    NavigationLink {
                        TrapezoidView()
                    } label: {
                        Text("animatibleData")
                    }
                    
                    NavigationLink {
                        CheckerboardView()
                    } label: {
                        Text("AnimatablePair")
                    }
                    
                    NavigationLink {
                        SpirographView()
                    } label: {
                        Text("Spirograph")
                    }
                                
                }
            }
            .navigationTitle("Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
