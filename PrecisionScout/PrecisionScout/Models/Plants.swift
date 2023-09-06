import SwiftUI

class Plants: ObservableObject {
    @Published var value: [Plant] = []
}
