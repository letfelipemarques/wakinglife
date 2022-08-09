import SwiftUI
import CoreData

// MARK: - CoreData
final class CoreDataController: ObservableObject {

    @Published private(set) var favoriteMovies = [FavoriteMovie]()

    var heart = "heart"

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "FavoriteMovies")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("xFelipe = \(error)")
            }
        }
        fetchFavoriteMovies()
    }

    func fetchFavoriteMovies() {
        let request = NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
        do {
            favoriteMovies = try container.viewContext.fetch(request)
        } catch let error {
            print("xFelipe = CoreData Fetch Error - \(error)")
        }
    }

    func save() {
        do {
            try container.viewContext.save()
            fetchFavoriteMovies()
        } catch let error {
            print("xFelipe = CoreData Save Error - \(error)")
        }
    }

    func createFavoriteMovie(title: String,
                             overview: String,
                             year: String,
                             posterPath: String,
                             rating: String) {
        let newFavorite = FavoriteMovie(context: container.viewContext)
        newFavorite.posterPath = posterPath
        newFavorite.rating = rating
        newFavorite.title = title
        newFavorite.overview = overview
        newFavorite.year = year
        save()
    }

    func deleteFavoriteMovie(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let movie = favoriteMovies[index]
        container.viewContext.delete(movie)
        save()
    }

    func checkIfSaved(movie: Movie) -> Bool {
        for index in 0..<favoriteMovies.count {
            if movie.title == favoriteMovies[index].title {
                return true
            }
        }
        return false
    }
}
