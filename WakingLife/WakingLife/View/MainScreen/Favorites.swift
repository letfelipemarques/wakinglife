import SwiftUI
// MARK: - Favorites Subview
struct Favorites: View {

    @StateObject private var coreDataController = CoreDataController()

    var body: some View {

        NavigationView {
            List {
                ForEach(coreDataController.favoriteMovies) { content in
                    VStack(alignment: .leading) {
                        Text(content.title ?? "Unknown")
                            .font(.title2)
                            .padding(5)
                            .foregroundColor(.accentColor)
                        Text(content.overview ?? "")
                            .font(.caption)
                            .padding(2)
                        Text(content.year ?? "")
                            .font(.subheadline)
                            .padding(2)
                        Text(content.rating ?? "")
                            .font(.subheadline)
                            .padding(2)
                    }
                }.onDelete(perform: coreDataController.deleteFavoriteMovie)
            }.navigationBarTitle("Favorites")
             .onAppear {
                 coreDataController.fetchFavoriteMovies()
            }
        }
    }
}
