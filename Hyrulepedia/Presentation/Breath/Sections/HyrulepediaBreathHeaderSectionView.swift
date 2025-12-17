import Combine
import SwiftUI

struct HyrulepediaBreathHeaderSectionView: View {
    // MARK: Modular variables
    @EnvironmentObject var viewModel: HyrulepediaBreathViewModel

    var body: some View {
        contentView
    }
}

// MARK: - Private UI
private extension HyrulepediaBreathHeaderSectionView {
    @ViewBuilder var contentView: some View {
        VStack {
            HStack {
                Button(action: {
                    // viewModel.didTapGoBack()
                }, label: {
                    Image(systemName: "arrow.backward")
                })
                .padding(10)
                .background(Color.black)
                .clipShape(.circle)
                Spacer()
            }
        }
    }
}
