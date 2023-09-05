

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    let users = [
        User(firstName: "Bob", lastName: "Vila"),
        User(firstName: "Bob", lastName: "Saget"),
        User(firstName: "Bob", lastName: "Loblaw"),
    ].sorted()

    var body: some View {
        if viewModel.isUnlocked {
            ZStack {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .background(.white)
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())

                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }

                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)

                VStack {
                    Spacer()

                    HStack {
                        Spacer()

                        Button {
                            viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
                    viewModel.update(location: newLocation)
                }
            }

            List(users) { user in
                Text("\(user.firstName) \(user.lastName)")
                    .onTapGesture {
                        let message = "Test"
                        let url = FileManager.documentsDirectory.appendingPathComponent("message.txt")

                        do {
                            try message.write(to: url, atomically: true, encoding: .utf8)

                            let input = try String(contentsOf: url)

                            print(input)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
            }
        } else {
            Button("Please Log In") {
                viewModel.authenticate()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
