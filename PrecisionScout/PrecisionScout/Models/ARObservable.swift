import SwiftUI

class ARObservable: ObservableObject {
    @Published var plants: [Plant] = []

    @Published var onPlane: Bool = false
}
