import SwiftUI

struct PlantsModal: View {
    @ObservedObject var plants: ARObservable
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(plants.plants.enumerated()), id: \.offset) { index, plant in
                HStack {
                    Text("\(index + 1). \(plant.emergence.rawValue)")
                        .foregroundColor(.white)

                    Spacer()

                    Text("\(index >= 1 ? getDistance(from: plants.plants[index - 1].position, to: plants.plants[index].position).displayImperial : "0'0\"")")
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }
        .padding()
    }
}

// struct PlantsModal_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantsModal()
//    }
// }
