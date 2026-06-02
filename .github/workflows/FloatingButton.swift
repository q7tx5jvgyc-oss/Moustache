import SwiftUI

struct FloatingButton: View {
    @ObservedObject var state: MenuState
    @State private var offset = CGSize.zero

    var body: some View {
        Circle()
            .fill(Color.purple)
            .frame(width: 60, height: 60)
            .overlay(Text("M").foregroundColor(.white))
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { offset = $0.translation }
            )
            .onTapGesture {
                state.isOpen.toggle()
            }
    }
}
