import Foundation
import Combine
import WidgetKit

class SharedDataInteractor: ObservableObject {
    // TODO: Should actually use a data service
    @Published var focusText: String
    var bag = Set<AnyCancellable>()

    init() {
        focusText = Self.loadFocus()
        $focusText
            .throttle(for: 0.5, scheduler: RunLoop.main, latest: true)
            .sink { [weak self] newText in
                self?.save(text: newText)
            }
            .store(in: &bag)
    }

    static func loadFocus() -> String {
        let sharedDefaults = UserDefaults(suiteName: "group.com.superart.FocusZero")
        let focusText = sharedDefaults?.string(forKey: "currentFocus") ?? "No Focus Set"

        return focusText
    }

    func save(text: String) {
        if let sharedDefaults = UserDefaults(suiteName: "group.com.superart.FocusZero") {
            sharedDefaults.set(text, forKey: "currentFocus")
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
}


