//
//  CheckerboardView.swift
//  Drawing
//
//  Created by Andrew Gilliland on 5/19/23.
//

import SwiftUI

struct CheckerboardView: View {
    @State private var rows = 4
    @State private var columns = 4
    
    
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
    }
}

struct CheckerboardView_Previews: PreviewProvider {
    static var previews: some View {
        CheckerboardView()
    }
}
