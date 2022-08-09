import SwiftUI
import Combine

// MARK: - Search Movies View Model

final class SearchMoviesViewModel: ObservableObject {

    @Published var moviesFound = [Movie]()

    func searchMovies(query: String) {

        guard let url = Endpoints.searchMovieURL(query: query) else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let movies = try JSONDecoder().decode(MovieResults.self, from: data)
                DispatchQueue.main.async {
                    self?.moviesFound = movies.results
                }
            } catch {
                print("xFelipe: \(error)")
            }
        }
        task.resume()
    }
}
