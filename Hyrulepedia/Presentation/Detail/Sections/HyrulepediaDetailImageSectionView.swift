//
//  HyrulepediaBreathFooterSectionView.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 29/11/25.
//

import Combine
import Kingfisher
import SwiftUI

struct HyrulepediaDetailImageSectionView: View {
    
    @EnvironmentObject var viewModel: HyrulepediaDetailViewModel
    
    var body: some View {
        contentView
    }
}

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
