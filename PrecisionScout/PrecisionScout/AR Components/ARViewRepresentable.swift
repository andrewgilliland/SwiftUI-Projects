import ARKit
import SwiftUI

struct ARViewRepresentable: UIViewRepresentable {
    @ObservedObject var arObservable: ARObservable

    func makeUIView(context _: Context) -> some UIView {
        return CustomARView(arObservable: arObservable)
    }

    func updateUIView(_: UIViewType, context _: Context) {}
}
