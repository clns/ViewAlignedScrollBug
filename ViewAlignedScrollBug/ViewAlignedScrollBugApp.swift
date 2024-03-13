import SwiftUI

@main
struct ViewAlignedScrollBugApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    let colors: [Color] = [.red, .yellow, .cyan, .blue, .teal, .brown, .orange, .indigo]
    @State private var selected: Int? = 0
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<colors.count, id: \.self) { index in
                    Rectangle()
                        .fill(colors[index])
                        .containerRelativeFrame(.horizontal)
                        .overlay {
                            Text(colors[index].description)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $selected)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}
