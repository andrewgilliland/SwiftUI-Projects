import SwiftUI

struct ContentView: View {
    @State private var isSubscribed = false
    @State private var animateCircle = false
    @State private var animateButton = false
    
    // https://www.youtube.com/watch?v=2-cgZhcd5Ec
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack(spacing: 50)
             {
                HStack {
                    Text("Subscribe\(isSubscribed ?  "d" : "")")
                        .bold()
                        .opacity(isSubscribed ? 1.0 : 0.5)
                    
                    Spacer()
                    
                    Image(systemName: isSubscribed ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 24))
                        .scaleEffect(isSubscribed ? 1.25 : 1.0)
                        .foregroundColor(isSubscribed ? .mint : .black)
                        .padding()
                        
                }
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isSubscribed.toggle()
                    }
                }
                .padding(.horizontal)
                 
                 // Spring Animations
                 Circle()
                     .frame(width: 100, height: 100)
                     .foregroundStyle(.linearGradient(colors: [.mint, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                     .offset(x: animateCircle ? 30 : 0, y: animateCircle ? -100 : 0)
                     .scaleEffect(animateCircle ? 2.0 : 1.0)
                     .onTapGesture {
                         withAnimation(.spring(response: 0.9, dampingFraction: 0.75, blendDuration: 0)) {
                             animateCircle.toggle()
                         }
                     }
                 
                 // Repeat
                 Button {
                     withAnimation(.easeInOut(duration: 1).repeatForever()) {
                         animateButton.toggle()
                     }
                 } label: {
                     Text("Animate")
                         .bold()
                         .frame(width: 200, height: 50)
                         .foregroundColor(.white)
                         .background(LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                         .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                         .shadow(radius: 3)
                         .opacity(animateButton ? 1.0 : 0.7)
                         .scaleEffect(animateButton ? 1.5 : 1.0)
                 }
                 .padding()
            }
            
        
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
