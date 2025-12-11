//
//  HyrulepediaTearsHeaderSectionView.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 29/11/25.
//


import Combine
import SwiftUI

struct HyrulepediaTearsHeaderSectionView: View {
    // MARK: Modular variables
    @EnvironmentObject var viewModel: HyrulepediaTearsViewModel

    var body: some View {
        contentView
    }
}

// MARK: - Private UI
private extension HyrulepediaTearsHeaderSectionView {
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
