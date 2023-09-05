import SwiftUI

struct ContentView: View {
    @State private var screenTitle = "Home"

    var body: some View {
        ARScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
