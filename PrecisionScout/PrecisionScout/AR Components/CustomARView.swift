import ARKit
import Combine
import RealityKit
import SwiftUI

class CustomARView: ARView {
    @ObservedObject var plants: Plants

    required init(plants: Plants, frame frameRect: CGRect) {
        self.plants = plants
        super.init(frame: frameRect)
    }

    @available(*, unavailable)
    dynamic required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(plants: Plants) {
        self.init(plants: plants, frame: UIScreen.main.bounds)

        subscribeToActionStream()
    }

    @MainActor dynamic required init(frame _: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    private var cancellables: Set<AnyCancellable> = []

    func subscribeToActionStream() {
        ARManager.shared
            .actionStream
            .sink { [weak self] action in

                switch action {
                case let .placePlant(emergence, color):
                    self?.placePlant(emergence: emergence, color: color)

                case .removeAllAnchors:
                    self?.scene.anchors.removeAll()
                }
            }
            .store(in: &cancellables)
    }

    func configurationExamples() {
        // Tracks the device relative to it's environment
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)

        // Not supported in all regions, tracks w.r.t. global coordinates
        let _ = ARGeoTrackingConfiguration()

        // Tracks faces in the scene
        let _ = ARFaceTrackingConfiguration()

        // Tracks bodies in the scene
        let _ = ARBodyTrackingConfiguration()
    }

    func anchorExamples() {
        // Attach anchors at specific coordinates in the iPhone-centered coordinate system
        let coordinateAnchor = AnchorEntity(world: .zero)

        // Attach anchors to detected planes (this works bes on devices with a LIDAR sensor)
//        let _ = AnchorEntity(plane: .horizontal)
//        let _ = AnchorEntity(plane: .vertical)

        // Attach anchors to tracked body parts, such as the face
        let _ = AnchorEntity(.face)

        // Attach anchors to tracked images, such as markers or visual codes
        let _ = AnchorEntity(.image(group: "group", name: "name"))

        // Add an anchor to the scene
        scene.addAnchor(coordinateAnchor)
    }

    func entityExample() {
        // Load an entity from a usdz file
        let _ = try? Entity.load(named: "usdzFileName")

        // Load an entity from a reality file
        let _ = try? Entity.load(named: "realityFileName")

        // Generate an entity with code
        let box = MeshResource.generateBox(size: 1)
        let entity = ModelEntity(mesh: box)

        // Add entity to an anchor, so it's placed in the scene
        let anchor = AnchorEntity()
        anchor.addChild(entity)
    }

    func placePlant(emergence: Emergence, color: Color) {
        let anchor = AnchorEntity(plane: .horizontal)

        anchor.addChild(ModelEntity(mesh: MeshResource.generateBox(size: 0.01), materials: [SimpleMaterial(color: UIColor(color), isMetallic: true)]))

        scene.addAnchor(anchor)

        plants.value.append(Plant(emergence: emergence, position: anchor.position))

        print("Plants: \(plants.value)")

        if plants.value.count >= 2 {
            print("More than one plant added")
        }

        guard let camera = session.currentFrame?.camera else { return }
        print(camera)
    }

    func getCurrentPosition() {
        print("getCurrentPosition")
//        print(session.currentFrame?.camera)
//        guard let camera = session.currentFrame?.camera else { return }

//        let cameraPosition = SCNVector3(camera.transform.columns.3.x, camera.transform.columns.3.y, camera.transform.columns.3.z)
//        let cameraPosition = camera.transform.translation
//        print(camera.transform)

//        let forwardDirection = SCNVector3(-camera.transform.m31, -camera.transform.m32, -camera.transform.m33)

//        let lookAtPoint = cameraPosition + forwardDirection
//        let lookAtPoint = cameraPosition + camera.transform.forward

//        return lookAtPoinst
    }
}
