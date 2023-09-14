import SwiftUI

extension Color {
    func name() -> String? {
        let colorDictionary: [Color: String] = [
            .green: "green",
            .yellow: "yellow",
            .orange: "orange",
            .red: "red",
            .pink: "pink",
            // Add more color mappings as needed
        ]

        return colorDictionary[self]
    }
}
