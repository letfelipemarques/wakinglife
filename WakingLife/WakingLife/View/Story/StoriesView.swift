import SwiftUI
// MARK: - Stories View
struct Stories: View {
    @StateObject var storiesViewModel = StoriesViewModel()
    @State var isLoading = true
    @State var isShowingSheet = false
    var body: some View {
        NavigationView {
            ScrollView(.horizontal,
                        showsIndicators: false) {
                HStack {
                    ForEach(storiesViewModel.stories) { story in
                        VStack {
                            Button {
                                storiesViewModel.selectStory(story)
                                isShowingSheet.toggle()
                            } label: {
                                AsyncImage(url: story.profilePhotoURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ActivityIndicatorView(isAnimated: $isLoading,
                                                          style: .large)
                                }
                            }.frame(width: 150,
                                    height: 150)
                            .clipShape(Circle())
                            .padding(5)
                            .sheet(isPresented: $isShowingSheet) {
                                StoryContentView(story: storiesViewModel.selectedStory!)
                            }
                            Text(story.name)
                                .foregroundColor(.primary)
                                .font(.subheadline)
                                .bold()
                        }
                    }
                }
            }.hiddenNavigationBarStyle()
        }.onAppear {
            storiesViewModel.getPopularPeople()
        }
    }
}
