//
//  ListView.swift
//  CupcakeCorner
//
//  Created by Andrew Gilliland on 5/22/23.
//

import SwiftUI

struct ListView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id:\.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
            
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            // fetch
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // .json()
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
