//
//  HomeScreenView.swift
//  PrecisionScout
//
//  Created by Andrew Gilliland on 7/13/23.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        VStack {
            Text("Sweet")
                .modifier(PrimaryHeading()
                )

            Button {
                print("Button Pressed")
            } label: {
                Image(systemName: "figure.run.square.stack")
                    .font(.system(size: 22, weight: .heavy))
                    .foregroundColor(.green)
                    .frame(width: 48, height: 48)
                    .background {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.white.opacity(0.2))
                    }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
