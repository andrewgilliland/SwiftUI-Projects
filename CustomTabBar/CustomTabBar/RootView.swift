//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Andrew Gilliland on 5/4/23.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .contacts
    
    var body: some View {
        VStack {
        
            Text("Hello, world!")
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        
        
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
