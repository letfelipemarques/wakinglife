import SwiftUI
import CoreData

struct MovieDetail: View {

    @StateObject private var coreDataController = CoreDataController()

    @State private var isLoading = true
    @State private var showSheet = false
    @State private var wasPressed = false
    @State private var heart = "heart"

    let movieDetailViewModel: MovieDetailViewModel

    var body: some View {
        NavigationView {
            VStack {
                MoviePoster(movieDetailViewModel: movieDetailViewModel)
                List {
                    Section {
                        Section {
                            Text(movieDetailViewModel.movie.overview
                                 ?? "")
                            .font(.subheadline)
                            Text("Year: \(movieDetailViewModel.formattedDate())")
                            Text("Rated: \(movieDetailViewModel.formattedRating())")
                        } header: {
                            Text("Overview")
                                .font(.body)
                        }
                    } header: {
                        HStack {
                            Text(movieDetailViewModel.movie.title ?? "Unknown")
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color.accentColor)
                                .lineLimit(2)
                            Button {
                                if coreDataController.checkIfSaved(movie: movieDetailViewModel.movie) {
                                } else {
                                    heart = "heart.fill"
                                    coreDataController.createFavoriteMovie(
                                        title: movieDetailViewModel
                                            .movie
                                            .title ?? "Unknown",
                                        overview: movieDetailViewModel
                                            .movie
                                            .overview ?? "",
                                        year: movieDetailViewModel
                                            .formattedDate(),
                                        posterPath: movieDetailViewModel
                                            .getPoster(),
                                        rating: movieDetailViewModel
                                            .formattedRating())
                                }
                            } label: {
                                Image(systemName: heart)
                                    .fixedSize()
                                    .foregroundColor(.pink)
                            }.onAppear {
                                if coreDataController.checkIfSaved(movie: movieDetailViewModel.movie) {
                                    heart = "heart.fill"
                                } else {
                                    heart = "heart"
                                }
                            }
                        }
                    }
                }
            }
        }.navigationTitle("About Me")
    }
}

struct MoviePoster: View {

    @State var isLoading = true

    let movieDetailViewModel: MovieDetailViewModel

    var body: some View {
        ZStack {
            AsyncImage(url: Endpoints.imageURL(path: movieDetailViewModel.getBackdrop())) { image in
                image.resizable()
                    .scaledToFill()
                    .cornerRadius(30)
            } placeholder: {
                ActivityIndicatorView(isAnimated: $isLoading,
                                      style: .large)
            }
            .frame(width: 300,
                   height: 300)
        }.hiddenNavigationBarStyle()
    }
}
