//
//  DataScreenView.swift
//  PrecisionScout
//
//  Created by Andrew Gilliland on 7/13/23.
//

import SwiftUI

struct DataTab: View {
    @Binding var cubes: [String: Int]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(cubes.sorted(by: <), id: \.key) { color, count in
                Text("\(color.capitalized): \(count)")
                    .padding(5)
            }
        }
        .background(.black)
        .cornerRadius(16)
    }
}

// struct DataScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataScreenView()
//    }
// }
