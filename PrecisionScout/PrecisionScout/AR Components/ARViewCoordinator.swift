import ARKit
import RealityKit
import SwiftUI

class ARViewCoordinator: NSObject, ARSCNViewDelegate {
    var sceneView: ARSCNView
    private var coachingOverlay: ARCoachingOverlayView
    private var configuration: ARWorldTrackingConfiguration

    override init() {
        sceneView = ARSCNView()
        configuration = ARWorldTrackingConfiguration()
        coachingOverlay = ARCoachingOverlayView()

        super.init()

        sceneView.delegate = self

        configuration.environmentTexturing = .automatic
        configuration.planeDetection = [.horizontal]
        configuration.worldAlignment = ARConfiguration.WorldAlignment.gravity

        sceneView.session.run(configuration)
        sceneView.layer.masksToBounds = true

        coachingOverlay.session = sceneView.session
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.activatesAutomatically = true
        coachingOverlay.setActive(true, animated: true)
        sceneView.addSubview(coachingOverlay)
        print("Init ARViewCoordinator --------------------------------")
    }

    func renderer(_: SCNSceneRenderer, didAdd _: SCNNode, for anchor: ARAnchor) {
        print("renderer")
        guard anchor is ARPlaneAnchor else { return }
        DispatchQueue.main.async {
            self.coachingOverlay.setActive(false, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {}
        }
    }

    func placeItem() {
        print("placeItem")

        let anchor = ARAnchor(name: "CustomAnchor", transform: simd_float4x4(diagonal: SIMD4<Float>(1, 1, 1, 1)))

        sceneView.session.add(anchor: anchor)
    }

    // Distance from camera to point
    // https://rockyshikoku.medium.com/measure-the-distance-between-the-camera-and-the-plane-with-arkit-4b5fcc9911cc
//    func hitTest() {
//        let hitTestResults = sceneView.hitTest(sceneView.center, types: [.existingPlaneUsingGeometry])
//        guard let result = hitTestResults.first else { return nil }
//        let hitCoordinates = simd_float3(x: result.worldTransform.columns.3.x, y: result.worldTransform.columns.3.y, z: result.worldTransform.columns.3.z)
//
//        // cameraCoordinates
    ////        let distance = distance(cameraCoordinates, hitCoordinates)
//    }
}
