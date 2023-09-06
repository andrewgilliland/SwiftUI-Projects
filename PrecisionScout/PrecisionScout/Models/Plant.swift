import SwiftUI

struct Plant: Hashable, Identifiable {
    let id = UUID()
    let emergence: Emergence
    let position: SIMD3<Float>
}
