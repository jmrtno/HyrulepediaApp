import SwiftUI

/// Screen for the `HyrulepediaBreath` .
///
/// It triggers the initial data load via `notifyAppearance()`.
struct HyrulepediaBreathScreen: View {
    
    // MARK: - State

    /// The screen's view model. Provided to child views via `.environmentObject(_:)`.
    @StateObject var viewModel = HyrulepediaBreathViewModel()
    
    // MARK: - Body

    /// Main view hierarchy.
    public var body: some View {
        ZStack {
            /// Themed background color for the screen
            BackgroundView()
            VStack {
                // header
                ScrollView {
                    content
                }
                footer
            }
            overlay
        }
        .environmentObject(viewModel)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.listCategory.capitalized)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .task {
            await viewModel.notifyAppearance()
        }
    }

    // MARK: - Sections

    /// Header section.
    private var header: some View {
        HyrulepediaBreathHeaderSectionView()
    }
    /// Main content section
    private var content: some View {
        HyrulepediaBreathInformationSectionView()
    }
    /// Footer section.
    private var footer: some View {
        HyrulepediaCrossFooterSectionView<HyrulepediaBreathViewModel>()
    }
    /// Loading overlay.
    private var overlay: some View {
        HyrulepediaCrossLoaderSectionView<HyrulepediaBreathViewModel>()
    }
}

private extension HyrulepediaBreathScreen {
    // MARK: - Background

    /// Themed background for the Breath screen, combining a black base,
    /// a red-accented gradient, and a tiled texture image.
    struct BackgroundView: View {
        var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.black,
                                 Color.black,
                                 Color.black,
                                 Color(red: 0.5,
                                       green: 0,
                                       blue: 0)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                Image("bgTexture")
                    .resizable()
            }
            .ignoresSafeArea()
        }
    }
}

// MARK: - Preview

/// Preview for `HyrulepediaBreath` screen`.
#Preview {
    HyrulepediaBreathScreen()
}
