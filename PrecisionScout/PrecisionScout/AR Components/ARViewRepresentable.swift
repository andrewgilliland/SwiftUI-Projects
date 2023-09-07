import ARKit
import SwiftUI

struct ARViewRepresentable: UIViewRepresentable {
    @ObservedObject var plants: Plants

    func makeUIView(context _: Context) -> some UIView {
        return CustomARView(plants: plants)
    }

    func updateUIView(_: UIViewType, context _: Context) {}
}
