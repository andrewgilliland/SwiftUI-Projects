//
//  View.swift
//  PrecisionScout
//
//  Created by Andrew Gilliland on 7/15/23.
//

import SwiftUI

extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        modifier(NavigationBarColorModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}
