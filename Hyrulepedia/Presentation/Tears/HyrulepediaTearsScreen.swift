//
//  HyrulepediaTearsScreen.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 30/11/25.
//

import SwiftUI
/// Screen for the `HyrulepediaTears`.
///
/// It triggers the initial data load via `notifyAppearance()`.
public struct HyrulepediaTearsScreen: View {
    
    // MARK: - State

    /// The screen's view model. Provided to child views via `.environmentObject(_:)`.
    @StateObject var viewModel = HyrulepediaTearsViewModel()

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
        .task {
            await viewModel.notifyAppearance()
        }
    }

    // MARK: - Sections

    /// Header section.
    private var header: some View {
        HyrulepediaTearsHeaderSectionView()
    }
    /// Main content section
    private var content: some View {
        HyrulepediaTearsInformationSectionView()
    }
    /// Footer section.
    private var footer: some View {
        HyrulepediaCrossFooterSectionView<HyrulepediaTearsViewModel>()
    }
    /// Loading overlay.
    private var overlay: some View {
        HyrulepediaTearsLoaderSectionView()
    }
}

private extension HyrulepediaTearsScreen {
    // MARK: - Background

    /// Themed background for the Breath screen, combining a black base,
    /// a red-accented gradient, and a tiled texture image.
    struct BackgroundView: View {
        var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black,
                                                Color.black,
                                                Color.black,
                                                Color(red: 0.5,
                                                      green: 0,
                                                      blue: 0)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Image("bgTexture")
                    .resizable()
            }
            .ignoresSafeArea()
        }
    }
}


// MARK: - Preview

/// Preview for `HyrulepediaTears` screen`.
#Preview {
    HyrulepediaBreathScreen()
}
