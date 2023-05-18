//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Andrew Gilliland on 5/4/23.
//

import SwiftUI

enum Tabs: Int {
    case chats = 0
    case newChats = 1
    case contacts = 2
}

struct CustomTabBar: View {
    @State private var selectedScreen = "Chats"
    @Binding var selectedTab: Tabs
    
    private struct Screen: Identifiable {
        let name: String
        let icon: String
        var id = UUID()
    }
    
    private let screens:[Screen]  = [Screen(name: "Chats", icon: "bubble.left"), Screen(name: "New Chat", icon: "plus.circle.fill"), Screen(name:"Contacts", icon: "person")]
    
    var body: some View {
        
        HStack (alignment: .center) {
            
            ForEach(screens){ screen in
                Button {
                    // switch to route
                    selectedTab = .chats
                } label: {
                    
                    GeometryReader { geo in
                        
                        if (selectedScreen == screen.name && screen.name != "New Chat") {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: geo.size.width/2, height: 4)
                                .padding(.leading, geo.size.width/4)
                        }
                        
                        VStack(alignment: .center, spacing: 4) {
                            
                            Image(systemName: screen.icon)
                                .resizable()
                                .foregroundColor(screen.name == "New Chat" ? .blue : .gray)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text(screen.name)
                                .font(.subheadline).fontWeight(.semibold).foregroundColor(screen.name == "New Chat" ? .blue : .gray)
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                    }
                }
            }
        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    @State var selectedTab: Tabs = .contacts
    
    static var previews: some View {
        CustomTabBar(selectedTab: )
    }
}
