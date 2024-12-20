import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataInteractor: SharedDataInteractor
    var body: some View {
        VStack {
            Spacer()
            TextField("Your text here", text: $dataInteractor.focusText)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
                .modifier(ClearButton(text: $dataInteractor.focusText))

            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
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
