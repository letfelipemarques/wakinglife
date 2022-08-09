import Foundation

// MARK: - My API Key
enum API {
    static let key = "INSERT_YOUR_API_KEY_HERE"
}

// MARK: - Assembling URLs

enum Endpoints {

    static func popularPeopleURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/person/popular"
        urlComponents.queryItems = [
                                    URLQueryItem(name: "api_key",
                                                 value: API.key),
                                    URLQueryItem(name: "language",
                                                 value: "en-US"),
                                    URLQueryItem(name: "page",
                                                 value: "1")
                                    ]
        return urlComponents.url
    }

    static func searchMovieURL(query: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/search/movie/"
        urlComponents.queryItems = [URLQueryItem(name: "api_key",
                                                 value: API.key),
                                    URLQueryItem(name: "query",
                                                 value: query),
                                    URLQueryItem(name: "page",
                                                 value: "1"),
                                    URLQueryItem(name: "include_adult",
                                                 value: "false")
                                    ]
        return urlComponents.url
    }

    static func imageURL(path: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "image.tmdb.org"
        urlComponents.path = "/t/p/original\(path)"
        return urlComponents.url
    }

    static func movieByCategoryURL(category: MoviesCategory) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/\(category.rawValue)"
        urlComponents.query =  "api_key=\(API.key)"
        return urlComponents.url
    }
}

// MARK: - Movie Categories

enum MoviesCategory: String {
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    case upcoming = "upcoming"
}

// MARK: - Types Of Query

enum QueryType: String {
    case movie
    case people
}
