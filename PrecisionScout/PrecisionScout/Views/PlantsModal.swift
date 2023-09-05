import SwiftUI

struct PlantsModal: View {
    @ObservedObject var plants: Plants
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(plants.value.enumerated()), id: \.offset) { index, plant in
                HStack {
                    Text("\(index + 1). \(plant.emergence.rawValue)")
                        .foregroundColor(.white)
//                        .background(.green)

                    Spacer()

                    Text("\(index >= 1 ? displayImperial(meters: getDistance(plants.value[index].position, plants.value[index - 1].position)) : "0'0\"")")
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
