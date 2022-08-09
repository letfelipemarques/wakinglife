import SwiftUI

// MARK: - Splash Screen
struct SplashScreen: View {

    @State private var isActive = false

    var body: some View {
        if isActive {
            Onboarding()
                .preferredColorScheme(.dark)
        } else {
            SplashScreenAnimation()
                .preferredColorScheme(.dark)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        isActive = true
                    }
                }
        }
    }
}

struct SplashScreenAnimation: View {
    var body: some View {
        ZStack {
            SplashImage()
        }.zIndex(2)
    }
}

struct SplashImage: View {
    @State private var size = 0.8
    @State private var opacity = 0.05
    var body: some View {
        VStack {
            Image("SplashScreen")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .frame(width: 200,
                       height: 200)
                .shadow(radius: 30)
            Text("Waking Life")
                .foregroundColor(.primary)
                .font(.largeTitle)
                .opacity(0.75)
        }.zIndex(1)
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
            }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .previewDevice("iPhone 11")
    }
}
