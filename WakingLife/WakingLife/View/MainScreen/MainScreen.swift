import SwiftUI
// MARK: - Main Screen View
struct MainScreen: View {
    init() {
        UITabBar.appearance()
            .backgroundColor = UIColor.black
    }
    var body: some View {
        NavigationView {
            TabView {
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                SearchMovies(searchQuery: "",
                             movieDetailViewModel: nil)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                Favorites()
                    .tabItem {
                        Image(systemName: "star")
                        Text("Favorites")
                    }
            }.hiddenNavigationBarStyle()
        }
    }
}
