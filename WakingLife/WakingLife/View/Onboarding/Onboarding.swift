import SwiftUI

// MARK: - Onboarding View

struct Onboarding: View {

    @State private var opacity = 0.05

    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .bold()
                        .padding(30)
                        .foregroundColor(.primary)
                    Spacer()
                    NavigationLink {
                        Home()
                            .preferredColorScheme(.dark)
                            .navigationBarHidden(true)
                    } label: {
                        Text("Let's go!")
                            .foregroundColor(.accentColor)
                            .bold()
                            .padding()
                    }
                }.zIndex(2)
                    .padding(.bottom, 670)
                OnboardTabs()
                    .zIndex(1)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.opacity = 1.0
                        }
                    }
            }.zIndex(1)
                .hiddenNavigationBarStyle()
        }
    }
}

struct OnboardTabs: View {

    var body: some View {
        TabView {
            OnboardingCard(content: OnboardingContent(title: "My debut",
                                                      content: "This is my first app ever! I really hope you enjoy",
                                                      imageName: "getting-started"))
            OnboardingCard(content: OnboardingContent(title: "Huh?",
                                                      content: "Please, consider rating my app afterwards",
                                                      imageName: "first-time"))
            OnboardingCard(content: OnboardingContent(title: "Be constructive",
                                                      content: "Tell me how can I serve you better too",
                                                      imageName: "please-leave-comment"))
            OnboardingCard(content: OnboardingContent(title: "Now",
                                                      content: "Go have some fun, you!",
                                                      imageName: "have-fun"))
        }.tabViewStyle(PageTabViewStyle())
         .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
