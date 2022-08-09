import SwiftUI
// MARK: - Oboarding Card Subview
struct OnboardingCard: View {

    let content: OnboardingContent?

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Gif(content?.imageName ?? "")
                    .frame(width: 300, height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.primary,
                                lineWidth: 1))
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.9)
                Text(content?.title ?? "")
                    .font(.system(size: 30,
                                  weight: .bold))
                    .foregroundColor(.primary)
                    .opacity(0.8)
                Text(content?.content ?? "")
                    .font(.system(size: 20,
                                  weight: .light))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .opacity(0.8)
            }.zIndex(3)
                .padding(200)
            RoundedRectangle(cornerRadius: 15)
                .fill(.primary)
                .zIndex(2)
                .frame(width: 350, height: 550)
                .opacity(0.15)
        }
    }
}
