import SwiftUI
// MARK: - Home Subview
struct Home: View {

    var body: some View {

        NavigationView {
            VStack {
                Stories()
                MoviesList()
            }.navigationTitle("Waking Life")
        }
    }
}
