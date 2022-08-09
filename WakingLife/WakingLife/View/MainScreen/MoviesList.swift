import SwiftUI
// MARK: - Movies List Subview
struct MoviesList: View {

    @StateObject private var homeViewModel = HomeViewModel()

    var body: some View {
        List {
            Section {
                ForEach(0..<homeViewModel.nowPlaying.count, id: \.self) { index in
                    if homeViewModel.upcoming.isEmpty {
                        Text("Loading")
                    } else {
                        NavigationLink(homeViewModel.upcoming[index].title ?? "Unknown") {
                            let movieDetailViewModel = MovieDetailViewModel(movie: homeViewModel.upcoming[index])
                            MovieDetail(movieDetailViewModel: movieDetailViewModel)
                        }
                    }
                }
            } header: {
                Text("Trending").foregroundColor(.accentColor)
            }
            Section {
                ForEach(0..<homeViewModel.nowPlaying.count, id: \.self) { index in
                    if homeViewModel.nowPlaying.isEmpty {
                        Text("Loading")
                    } else {
                        NavigationLink(homeViewModel.nowPlaying[index].title ?? "Loading") {
                            let movieDetailViewModel = MovieDetailViewModel(movie: homeViewModel.nowPlaying[index])
                            MovieDetail(movieDetailViewModel: movieDetailViewModel)
                        }
                    }
                }
            } header: {
                Text("In Theatres").foregroundColor(.accentColor)
            }
            Section {
                ForEach(0..<homeViewModel.nowPlaying.count, id: \.self) { index in
                    if homeViewModel.topRated.isEmpty {
                        Text("Loading")
                    } else {
                        NavigationLink(homeViewModel.topRated[index].title ?? "Loading") {
                            let movieDetailViewModel = MovieDetailViewModel(movie: homeViewModel.topRated[index])
                            MovieDetail(movieDetailViewModel: movieDetailViewModel)
                        }
                    }
                }
            } header: {
                Text("Top Rated").foregroundColor(.accentColor)
            }
        }
        .onAppear {
            guard let nowPlaying = Endpoints.movieByCategoryURL(category: .nowPlaying)
            else { return }
            homeViewModel.getMovies(withCategoryURL: nowPlaying,
                                    andCategory: .nowPlaying)
            guard let topRated = Endpoints.movieByCategoryURL(category: .topRated)
            else { return }
            homeViewModel.getMovies(withCategoryURL: topRated,
                                    andCategory: .topRated)
            guard let upcoming = Endpoints.movieByCategoryURL(category: .upcoming)
            else { return }
            homeViewModel.getMovies(withCategoryURL: upcoming,
                                    andCategory: .upcoming)
        }
    }
}
