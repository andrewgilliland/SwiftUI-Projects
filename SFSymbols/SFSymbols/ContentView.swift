//
//  ContentView.swift
//  SFSymbols
//
//  Created by Andrew Gilliland on 7/11/23.
//

import SwiftUI

struct Icon: Hashable {
    let name: String
    let color: Color
}

struct ContentView: View {
    @State private var value = 1.0
    
    let symbols = [
        Icon(name: "globe", color: .red),
        Icon(name: "cloud", color: .green),
        Icon(name: "gamecontroller", color: .pink),
        Icon(name: "folder.fill.badge.plus", color: .yellow),
        Icon(name: "scribble", color: .cyan),
        Icon(name: "airtag.fill", color: .purple),
        Icon(name: "pc", color: .indigo),
        Icon(name: "ipod", color: .mint),
        Icon(name: "theatermasks", color: .blue),
        Icon(name: "person.3.sequence.fill", color: .gray),
    ]
    
    let valueSymbols = [
        Icon(name: "aqi.low", color: .red),
        Icon(name: "wifi", color: .blue),
        Icon(name: "chart.bar.fill", color: .yellow),
        Icon(name: "waveform", color: .green),
    ]
    
    let data = Array(1...12)
    
    var body: some View {
        
        ScrollView {
            HStack {
                Image(systemName: "cloud.sun.rain.fill")
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white, .yellow, .blue)
                    .font(.system(size: 24))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 2)
                    )
                    .padding()
                
                Image(systemName: "person.3.sequence.fill")
                    .frame(width: 80, height: 80)
                    .font(.system(size: 24))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(
                        .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 2)
                    )
                    
                
            }
            
            VStack {
                HStack {
                    ForEach(valueSymbols, id: \.name) { symbol in
                        Image(systemName: symbol.name, variableValue: value)
                            .foregroundStyle(symbol.color)
                            .frame(width: 80, height: 80)
                            .font(.system(size: 24))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray, lineWidth: 2)
                            )
                    }
                }
                
                Slider(value: $value)
            }
            .padding()
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
            ], spacing: 16) {
                ForEach(symbols, id: \.self) { symbol in
                    Image(systemName: symbol.name)
                        .foregroundStyle(symbol.color)
                        .symbolRenderingMode(.hierarchical)
                        .font(.system(size: 24))
                        .frame(width: 80, height: 80)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 2)
                        )
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
            
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
