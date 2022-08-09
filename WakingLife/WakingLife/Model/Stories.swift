import Foundation

// MARK: - Story Icon Model
struct Story: Identifiable {

    let id = UUID()
    let name: String
    let profilePhotoURL: URL
    let knownFor: Movie
    let posterURL: URL

    init?(person: People) {
        guard let name = person.name,
                let photo = person.profilePath,
                let bestMovie = person.knownFor?.first,
                let poster = person.knownFor?.first?.posterPath else { return nil }
        guard let photoURL = Endpoints.imageURL(path: photo),
              let posterURL = Endpoints.imageURL(path: poster) else { return nil }
        self.name = name
        self.profilePhotoURL = photoURL
        self.knownFor = bestMovie
        self.posterURL = posterURL
    }
}
