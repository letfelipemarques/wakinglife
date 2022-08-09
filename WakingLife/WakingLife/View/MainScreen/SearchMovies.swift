import SwiftUI

struct SearchMovies: View {
    @State var searchQuery = ""
    let movieDetailViewModel: MovieDetailViewModel?
    let searchMoviesViewModel = SearchMoviesViewModel()
    var body: some View {
        NavigationView {
            List(searchMoviesViewModel.moviesFound, id: \.id) { movie in
                NavigationLink(movie.title ?? "Unknown") {
                    MovieDetail(movieDetailViewModel: MovieDetailViewModel(movie: movie))
                }
            }.navigationBarTitleDisplayMode(.large)
             .navigationTitle("Search Movies")
        }
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchQuery) { value in
                Task {
                    if !value.isEmpty {
                        searchMoviesViewModel.searchMovies(query: searchQuery)
                    } else {
                        searchMoviesViewModel.moviesFound.removeAll()
                    }
                }
            }
    }
}
