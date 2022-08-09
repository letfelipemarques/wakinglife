// MARK: - People Model
struct People: Codable, Identifiable {

    let id: Int?
    let name: String?
    let profilePath: String?
    let knownFor: [Movie]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

struct PeopleResults: Codable {
    let results: [People]
}
