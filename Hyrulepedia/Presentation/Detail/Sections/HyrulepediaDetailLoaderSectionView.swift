import Combine
import SwiftUI

struct HyrulepediaDetailLoaderSectionView: View {
    // MARK: Modular variables
    @EnvironmentObject var viewModel: HyrulepediaDetailViewModel

    // MARK: Environments & State
    @State private var degrees = 0.0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        loaderContainer
    }
}

// MARK: - Private UI
private extension HyrulepediaDetailLoaderSectionView {
    @ViewBuilder var loaderContainer: some View {
        if viewModel.isLoading {
            customLoader()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func customLoader() -> some View {
        Image("loaderIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 250)
            .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
            .onAppear {
                startInfiniteAnimation()
            }
    }

    func startInfiniteAnimation() {
        guard !isAnimating else { return }
        isAnimating = true
        let interval: Double = 0.05
        let increment: Double = 7

        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            withAnimation(.easeIn(duration: interval)) {
                degrees += increment
            }
            /// Reset degrees to avoid overflow
            if degrees >= 360 {
                degrees -= 360
            }
        }
    }
}
