import simd
import SwiftUI

func getDistance(from: SIMD3<Float>, to: SIMD3<Float>) -> Float {
    let difference = to - from
    let squaredDistance = dot(difference, difference)
    let distance = sqrt(squaredDistance)
    // print("\(distance)")

    return distance
}

struct ARScreen: View {
    @ObservedObject var arObservable = ARObservable()
    @State private var isMenuOpen = false

    let buttonOptions: [ButtonOption] = [ButtonOption(emergence: .good, color: .green), ButtonOption(emergence: .le1, color: .yellow), ButtonOption(emergence: .le2, color: .orange), ButtonOption(emergence: .noGerm, color: .red)]

    var body: some View {
        ARViewRepresentable(plants: arObservable)
            .overlay {
                ZStack {
//                    Image(systemName: "plus.circle")
//                        .foregroundColor(.white)
//                        .font(.system(size: 28))

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
                                    arObservable.plants = []
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
                                        print("\(arObservable.onPlane)")

                                    } label: {
                                        ZStack {
                                            buttonOption.color
                                                .frame(width: 70, height: 70)
                                                .opacity(arObservable.onPlane ? 1 : 0.5)
                                                .cornerRadius(8)
                                            Text(buttonOption.emergence.rawValue)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                        }
                                    }
                                    .disabled(!arObservable.onPlane)
                                }
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 30)
                }
            }
            .onChange(of: arObservable.onPlane) { _ in
                print("onChange onPlane: \(arObservable.onPlane)")
            }
            .ignoresSafeArea()
            .sheet(isPresented: $isMenuOpen) {
                PlantsModal(plants: arObservable)
            }
    }
}

struct ARScreen_Previews: PreviewProvider {
    static var previews: some View {
        ARScreen()
    }
}
