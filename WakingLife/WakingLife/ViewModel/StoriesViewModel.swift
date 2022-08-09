import SwiftUI

// MARK: - StoriesViewModel
final class StoriesViewModel: ObservableObject {
    @Published private(set) var stories = [Story]()
    @Published private(set) var selectedStory: Story?
    func getPopularPeople() {
        guard let url = Endpoints.popularPeopleURL() else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let popularPeople  = try JSONDecoder().decode(PeopleResults.self, from: data)
                DispatchQueue.main.async {
                    self?.stories = Array(popularPeople.results.compactMap(Story.init).prefix(upTo: 8))
                }
            } catch {
                print("xFelipe: \(error)")
            }
        }
        task.resume()
    }
    func selectStory(_ story: Story) {
        self.selectedStory = story
    }
}
