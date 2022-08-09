import SwiftUI
// MARK: - Story Content View
struct StoryContentView: View {
    @StateObject var storiesViewModel = StoriesViewModel()
    @State var isLoading = true
    @State var showSheet = false
    @State var story: Story
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            ZStack {
                AsyncImage(url: story.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ActivityIndicatorView(isAnimated: $isLoading,
                                          style: .large)
                }.frame(width: 1000, height: 1000)
                 .blur(radius: 30)
                AsyncImage(url: story.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ActivityIndicatorView(isAnimated: $isLoading,
                                          style: .large)
                }.frame(width: 380, height: 600)
                 .cornerRadius(15)
            }
        }.sheet(isPresented: $showSheet) {
            let movieDetailViewModel = MovieDetailViewModel(movie: story.knownFor)
            MovieDetail(movieDetailViewModel: movieDetailViewModel)
        }
    }
}
