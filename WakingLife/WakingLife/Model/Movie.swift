// MARK: - Movie Model
struct Movie: Codable, Identifiable {

    let id: Int?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

struct MovieResults: Codable {
    let results: [Movie]
}
