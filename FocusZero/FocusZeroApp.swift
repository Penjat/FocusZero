import SwiftUI

@main
struct FocusZeroApp: App {
    let sharedDataInteractor = SharedDataInteractor()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .background(Color(red: 154/254, green: 123/254, blue: 201/254))
                .environmentObject(sharedDataInteractor)
        }
    }
}
