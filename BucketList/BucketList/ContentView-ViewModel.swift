import Foundation
import LocalAuthentication
import MapKit

extension ContentView {
    // "Every time you have a class that conforms to ObservableObject, add @MainActor. Just do it." - Paul Hudson
    @MainActor class ViewModel: ObservableObject {
        @Published var isUnlocked = false
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15))
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?

        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }

        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }

        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude:
                mapRegion.center.longitude)
            locations.append(newLocation)
            save()
        }

        func update(location: Location) {
            guard let selectedPlace = selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }

        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need to unlock your data") { success, _ in
                    if success {
                        Task { @MainActor in
                            // authenticated successfully
                            print("Is Unlocked")
                            self.isUnlocked = true
                        }
                    } else {
                        // there was an error
                        print("Error")
                    }
                }
            } else {
                // there were no biometrics
            }
        }
    }
}
