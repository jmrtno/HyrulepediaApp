import Combine
import Kingfisher
import SwiftUI

struct HyrulepediaDetailImageSectionView: View {

    // MARK: Modular variables
    
    @EnvironmentObject var viewModel: HyrulepediaDetailViewModel
    
    var body: some View {
        contentView
    }
}

// MARK: - Private UI

private extension HyrulepediaDetailImageSectionView {
    @ViewBuilder
    var contentView: some View {
        if !viewModel.isLoading {
            getImageView()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func getImageView() -> some View {
        VStack {
            KFImage(URL(string: viewModel.item.image))
                .resizable()
                .placeholder{
                    ProgressView()
                }
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
                .opacity(0.5)
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]),
                        startPoint: .center,
                        endPoint: .bottom
                    )
                )
            Spacer()
        }
    }
}
