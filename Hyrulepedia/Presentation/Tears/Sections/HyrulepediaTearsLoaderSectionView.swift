//
//  HyrulepediaTearsLoaderSectionView.swift
import Combine
import SwiftUI

struct HyrulepediaTearsLoaderSectionView: View {
    // MARK: Modular variables
    @EnvironmentObject var viewModel: HyrulepediaTearsViewModel

    // MARK: Environments & State
    @State private var degrees = 0.0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        loaderContainer
    }
}

// MARK: - Private UI
private extension HyrulepediaTearsLoaderSectionView {
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

    private func startInfiniteAnimation() {
        guard !isAnimating else { return }  // Evitar múltiples animaciones simultáneas
        isAnimating = true
        let interval: Double = 0.05  // Intervalo de actualización de la animación
        let increment: Double = 7  // Incremento de grados por cada intervalo

        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            withAnimation(.easeIn(duration: interval)) {
                degrees += increment
            }
            // Reset degrees to avoid overflow
            if degrees >= 360 {
                degrees -= 360
            }
        }
    }
}
