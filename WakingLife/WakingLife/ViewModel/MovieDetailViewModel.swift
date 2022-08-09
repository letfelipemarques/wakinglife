import SwiftUI

// MARK: - MovieDetailViewModel
final class MovieDetailViewModel: ObservableObject {

    @Published private(set) var movie: Movie

    func formattedDate() -> String {
        guard let year = movie.releaseDate else { return "" }
        return "Year: " + (String(year.dropLast(6)))
    }

    func formattedRating() -> String {
        guard let rating = movie.voteAverage else { return "" }
        return "Rated: \(rating)/10"
    }

    func getBackdrop() -> String {
        guard let backdrop = movie.backdropPath else { return "" }
        return backdrop
    }

    func getPoster() -> String {
        guard let poster = movie.posterPath else { return "" }
        return poster
    }

    init(movie: Movie) {
        self.movie = movie
    }
}
