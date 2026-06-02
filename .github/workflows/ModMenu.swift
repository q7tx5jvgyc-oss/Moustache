import SwiftUI

struct ModMenu: View {
    @ObservedObject var state: MenuState

    var body: some View {
        VStack {

            Text("MOUSTACHE MENU")
                .foregroundColor(.white)

            Button("Home") {
                state.selectedTab = 0
            }

            Button("Scripts") {
                state.selectedTab = 1
            }

            Button("Settings") {
                state.selectedTab = 2
            }
        }
        .padding()
        .background(Color.black.opacity(0.9))
    }
}
