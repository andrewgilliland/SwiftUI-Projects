import simd
import SwiftUI

struct ButtonOption: Hashable {
    let emergence: Emergence
    let color: Color
}

func getDistance(_ pointA: SIMD3<Float>, _ pointB: SIMD3<Float>) -> Float {
    let difference = pointB - pointA
    let squaredDistance = dot(difference, difference)
    let distance = sqrt(squaredDistance)

    return distance
}

func displayImperial(meters: Float) -> String {
    let totalInches = Int(39.3701 * meters)
    let feet = totalInches / 12
    let inches = totalInches % 12

    return "\(feet)'\(inches)\""
}

struct ARScreen: View {
    @ObservedObject var plants = Plants()
    @State private var isMenuOpen = false

    let buttonOptions: [ButtonOption] = [ButtonOption(emergence: .good, color: .green), ButtonOption(emergence: .le1, color: .yellow), ButtonOption(emergence: .le2, color: .orange), ButtonOption(emergence: .noGerm, color: .red)]

    var body: some View {
        ARViewRepresentable(plants: plants)
            .overlay {
                ZStack {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 28))

                    VStack {
                        Spacer()

                        HStack {
                            Spacer()

                            VStack {
                                Button {
                                    isMenuOpen = true
                                } label: {
                                    Image(systemName: "square.stack.fill")
                                        .foregroundColor(.green)
                                        .font(.system(size: 28))
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(.black)
                                        .cornerRadius(8)
                                }

                                Button {
                                    ARManager.shared.actionStream.send(.removeAllAnchors)
                                    plants.value = []
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .font(.system(size: 28))
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(.black)
                                        .cornerRadius(8)
                                }

                                ForEach(buttonOptions, id: \.self) { buttonOption in
                                    Button {
                                        ARManager.shared.actionStream.send(.placePlant(emergence: buttonOption.emergence, color: buttonOption.color))

                                    } label: {
                                        ZStack {
                                            buttonOption.color
                                                .frame(width: 70, height: 70)
                                                .background(buttonOption.color)
                                                .cornerRadius(8)
                                            Text(buttonOption.emergence.rawValue)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 30)
                }
            }
            .ignoresSafeArea()
            .sheet(isPresented: $isMenuOpen) {
                PlantsModal(plants: plants)
            }
    }
}

struct ARScreen_Previews: PreviewProvider {
    static var previews: some View {
        ARScreen()
    }
}
