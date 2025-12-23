import SwiftUI

/// Screen for the `HyrulepediaDetail` .
///
/// It triggers the initial data load via `notifyAppearance()`.
struct HyrulepediaDetailScreen: View {
    
    /// The screen's view model. Provided to child views via `.environmentObject(_:)`.
    @StateObject private var viewModel: HyrulepediaDetailViewModel

    /// Initializes the screen with the identifiers required to load the detail.
    /// - Parameters:
    ///   - itemId: Identifier of the item to display.
    ///   - gameId: Identifier of the game the item belongs to.
    init(itemId: Int, gameId: String) {
        _viewModel = StateObject(wrappedValue: HyrulepediaDetailViewModel(itemId: itemId, gameId: gameId))
    }
    
    /// Main body of the view.
    public var body: some View {
        ZStack {
            /// Themed background color for the screen
            BackgroundView()
            imgBg
            VStack {
                // header
                GeometryReader { geometry in
                  ScrollView {
                      content
                      .frame(width: geometry.size.width)
                      .frame(minHeight: geometry.size.height)
                  }
                }
            }
            overlay
        }
        .environmentObject(viewModel)
        .task {
            await viewModel.notifyAppearance()
        }
    }

    /// Featured image section of the detail.
    private var imgBg: some View {
        HyrulepediaDetailImageSectionView()
    }
    /// Detail header.
    private var header: some View {
        HyrulepediaDetailHeaderSectionView()
    }
    /// Main section containing the detailed information.
    private var content: some View {
        HyrulepediaDetailInformationSectionView()
    }
    /// Loading overlay.
    private var overlay: some View {
        HyrulepediaCrossLoaderSectionView<HyrulepediaDetailViewModel>()
    }
}

private extension HyrulepediaDetailScreen {
    /// Themed background with gradient and texture for the detail screen.
    struct BackgroundView: View {
        var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black,
                                                Color.black,
                                                Color.black,
                                                Color(red: 0,
                                                      green: 0,
                                                      blue: 0.5)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Image("bgTexture")
                    .resizable()
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    HyrulepediaDetailScreen(itemId: 1, gameId: "1")
}

