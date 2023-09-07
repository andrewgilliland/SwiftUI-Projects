import ARKit
import Combine
import RealityKit
import SwiftUI

class CustomARView: ARView, ARSessionDelegate {
    @ObservedObject var plants: Plants
    var timer: Timer?
    var cameraPosition: simd_float3?

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

        configureSession()
        subscribeToActionStream()
    }

    func session(_: ARSession, didUpdate _: [ARAnchor]) {
//        startCameraPositionUpdateTimer()
    }

//    private func session(_: ARView, didAdd anchors: [ARAnchor]) {
//        print("session: didAdd")
//        for anchor in anchors {
//            if let planeAnchor = anchor as? ARPlaneAnchor {
//                let extent = planeAnchor.extent
//                let center = planeAnchor.center
//            }
//        }
//    }

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

    func startCameraPositionUpdateTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let camera = self?.session.currentFrame?.camera else { return }
            let cameraTransform = camera.transform
            self?.cameraPosition = simd_make_float3(cameraTransform.columns.3)

            print("Camera Position: \(String(describing: self?.cameraPosition))")

            if !(self?.plants.value.isEmpty)! {
//                self?.drawLine()
            }
        }
    }

    func drawLine(from: SIMD3<Float>, to: SIMD3<Float>) {
        print("from: \(from)")
        print("to: \(to)")

        let midpoint = (from + to) / 2
        print("midpoint: \(midpoint)")

        let line = AnchorEntity()
        line.position = midpoint
        line.look(at: from, from: midpoint, relativeTo: nil)

        let meters = simd_distance(from, to)
        print("\(meters) m")
        let lineMaterial = SimpleMaterial(color: .red, roughness: 1, isMetallic: false)
        let bottomLineMesh = MeshResource.generateBox(width: 0.005, height: 0.005, depth: meters)
        let bottomLineEntity = ModelEntity(mesh: bottomLineMesh, materials: [lineMaterial])
        bottomLineEntity.position = .init(midpoint)

        line.addChild(bottomLineEntity)

        scene.addAnchor(line)
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

    func configureSession() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        session.run(config)
        session.delegate = self
    }

    func placePlant(emergence: Emergence, color: Color) {
        let rayCast = raycast(from: CGPoint(x: bounds.midX, y: bounds.midY), allowing: .existingPlaneGeometry, alignment: .horizontal).first
        print(String(describing: rayCast?.worldTransform))

        let anchor = AnchorEntity(plane: .horizontal)

        anchor.addChild(ModelEntity(mesh: MeshResource.generateBox(size: 0.01), materials: [SimpleMaterial(color: UIColor(color), isMetallic: true)]))

        scene.addAnchor(anchor)

        plants.value.append(Plant(emergence: emergence, position: anchor.position(relativeTo: nil)))

//        print("Plants: \(plants.value)")

//        let allAnchors = scene.anchors
//        print(allAnchors)

        for case let anchorEntity as AnchorEntity in scene.anchors {
            print(anchorEntity.position(relativeTo: nil))
        }

        if plants.value.count >= 2 {
//            print("More than one plant added")
            drawLine(from: plants.value.dropLast().last?.position ?? SIMD3<Float>(-0.1, -0.1, -0.1), to: plants.value.last?.position ?? SIMD3<Float>(0.1, 0.1, 0.1))
        }
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
