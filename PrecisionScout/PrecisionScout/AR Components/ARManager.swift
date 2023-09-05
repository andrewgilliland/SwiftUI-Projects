import Combine

class ARManager {
    // Singleton pattern - only one class will be used
    static let shared = ARManager()
    private init() {}

    var actionStream = PassthroughSubject<ARAction, Never>()
}
