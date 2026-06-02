import SwiftUI

class MenuState: ObservableObject {
    @Published var isOpen = false
    @Published var selectedTab = 0
}

struct ContentView: View {
    @StateObject var state = MenuState()

    var body: some View {
        ZStack {

            // خلفية
            Color.black.ignoresSafeArea()

            // نص رئيسي
            Text("Moustache 🔥")
                .foregroundColor(.white)
                .font(.largeTitle)

            // زر عائم
            VStack {
                Spacer()

                HStack {
                    Spacer()

                    FloatingButton(state: state)
                }
            }

            // المود منيو
            if state.isOpen {
                ModMenu(state: state)
            }
        }
    }
}

// MARK: - Floating Button
struct FloatingButton: View {
    @ObservedObject var state: MenuState
    @State private var offset = CGSize.zero

    var body: some View {
        Circle()
            .fill(Color.purple)
            .frame(width: 60, height: 60)
            .overlay(Text("M").foregroundColor(.white))
            .shadow(color: .purple, radius: 10)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = value.translation
                    }
            )
            .onTapGesture {
                state.isOpen.toggle()
            }
            .padding()
    }
}

// MARK: - Mod Menu
struct ModMenu: View {
    @ObservedObject var state: MenuState

    var body: some View {
        VStack(spacing: 0) {

            // Header
            HStack {
                Text("MOUSTACHE MENU")
                    .foregroundColor(.white)
                    .font(.headline)

                Spacer()

                Button("✖") {
                    state.isOpen = false
                }
                .foregroundColor(.red)
            }
            .padding()
            .background(Color.black.opacity(0.9))

            Divider().background(Color.purple)

            // Tabs
            HStack {
                tabButton("Home", 0)
                tabButton("Scripts", 1)
                tabButton("Settings", 2)
            }
            .padding(.vertical, 10)

            Divider().background(Color.purple)

            // المحتوى
            if state.selectedTab == 0 {
                homeTab
            } else if state.selectedTab == 1 {
                scriptsTab
            } else {
                settingsTab
            }

            Spacer()
        }
        .frame(width: 300, height: 400)
        .background(Color.black.opacity(0.95))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.purple, lineWidth: 2)
        )
        .padding()
    }

    func tabButton(_ title: String, _ index: Int) -> some View {
        Button(action: {
            state.selectedTab = index
        }) {
            Text(title)
                .foregroundColor(state.selectedTab == index ? .purple : .white)
                .padding(.horizontal)
        }
    }

    var homeTab: some View {
        VStack(spacing: 15) {
            Text("Home")
                .foregroundColor(.white)

            Button("Start") {
                print("Start")
            }
            .buttonStyle(.borderedProminent)

            Button("Stop") {
                print("Stop")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    var scriptsTab: some View {
        VStack {
            Text("Scripts")
                .foregroundColor(.white)

            Text("No scripts yet")
                .foregroundColor(.gray)
        }
        .padding()
    }

    var settingsTab: some View {
        VStack {
            Toggle("Enable Feature", isOn: .constant(true))
                .tint(.purple)
                .padding()

            Text("Moustache Settings")
                .foregroundColor(.gray)
        }
        .padding()
    }
}
