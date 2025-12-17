import Combine
import SwiftUI

struct HyrulepediaDetailHeaderSectionView: View {
    // MARK: Modular variables
    @EnvironmentObject var viewModel: HyrulepediaDetailViewModel

    var body: some View {
        contentView
    }
}

// MARK: - Private UI
private extension HyrulepediaDetailHeaderSectionView {
    @ViewBuilder var contentView: some View {
        VStack {
            HStack {
                Button(action: {
                    // viewModel.dismissModal
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
