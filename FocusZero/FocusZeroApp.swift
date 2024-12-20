import SwiftUI

@main
struct FocusZeroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(focusText: loadFocus() ?? "").background(Color(red: 154/254, green: 123/254, blue: 201/254))
        }
    }

    func loadFocus() -> String? {
        let sharedDefaults = UserDefaults(suiteName: "group.com.superart.FocusZero")
        let focusText = sharedDefaults?.string(forKey: "currentFocus") ?? "No Focus Set"

        return focusText
    }
}
