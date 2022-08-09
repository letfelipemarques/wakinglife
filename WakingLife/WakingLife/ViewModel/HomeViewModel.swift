import SwiftUI

// MARK: - HomeViewModel
final class HomeViewModel: ObservableObject {

    @Published private(set) var nowPlaying = [Movie]()
    @Published private(set) var topRated = [Movie]()
    @Published private(set) var upcoming = [Movie]()

    func getMovies(withCategoryURL url: URL, andCategory category: MoviesCategory) {

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let movies = try JSONDecoder().decode(MovieResults.self, from: data)
                DispatchQueue.main.async {
                    switch category {
                    case .nowPlaying:
                        self?.nowPlaying = movies.results
                    case .topRated:
                        self?.topRated = movies.results
                    case .upcoming:
                        self?.upcoming = movies.results
                    }
                }
            } catch {
                print("xFelipe: \(error)")
            }
        }
        task.resume()
    }
}
