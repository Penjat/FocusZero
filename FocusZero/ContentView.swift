import SwiftUI
import WidgetKit


struct ContentView: View {
    @State var focusText: String
    var body: some View {
        VStack {
            Spacer()
            TextField("Your text here", text: $focusText)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
                .modifier(ClearButton(text: $focusText))

            Spacer()
            Button {
                if let sharedDefaults = UserDefaults(suiteName: "group.com.superart.FocusZero") {
                    sharedDefaults.set(focusText, forKey: "currentFocus")
                    // The widget can now read this value
                    WidgetCenter.shared.reloadAllTimelines()
                }
            } label: {
                Text("update")
            }
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    ContentView(focusText: "butt")
}



struct ClearButton: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View {
        HStack {
            content
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "multiply.circle.fill")
                    .foregroundColor(.secondary)
            }
        }
    }
}
