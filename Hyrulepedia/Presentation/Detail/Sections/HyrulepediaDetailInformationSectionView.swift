import Combine
import Kingfisher
import SwiftUI

struct HyrulepediaDetailInformationSectionView: View {
    // MARK: Modular Variable
    @EnvironmentObject var viewModel: HyrulepediaDetailViewModel

    var body: some View {
        contentView
    }
}

// MARK: - Private UI

private extension HyrulepediaDetailInformationSectionView {
    @ViewBuilder
    var contentView: some View {
        if !viewModel.isLoading {
            VStack(spacing: 20) {
                Text(viewModel.item.name.capitalized)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .italic()
                Text(viewModel.item.description)
                    .font(.body)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                Divider()
                    .frame(width: 300, height: 2)
                    .overlay(.gray)
                getItemDetailCarousel(detailItem: viewModel.item)
            }
            .padding(.horizontal, 20)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func getItemDetailCarousel(detailItem: HyrulepediaDataEntity) -> some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 25) {
                getLocation(detailItem: detailItem)
                getDrops(detailItem: detailItem)
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 45, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }

    @ViewBuilder
    func getLocation(detailItem: HyrulepediaDataEntity) -> some View {
        let locations = detailItem.commonLocations ?? []
        if !locations.isEmpty {
            VStack(alignment: .leading) {
                Text("Locations")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white.opacity(0.5))
                    .italic()
                Divider()
                    .frame(height: 1)
                    .overlay(.gray)
                ForEach(locations, id: \.self) { location in
                    Text(location.capitalized)
                        .font(.body)
                        .foregroundStyle(.white)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 150)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding(.bottom, 40)
            .padding(.top, 10)
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0.5)
                    .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
            }
        }
    }
    
    @ViewBuilder
    func getDrops(detailItem: HyrulepediaDataEntity) -> some View {
        let drops = detailItem.drops ?? []
        if !drops.isEmpty {
            VStack(alignment: .leading) {
                Text("Drops")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white.opacity(0.5))
                    .italic()
                Divider()
                    .frame(height: 1)
                    .overlay(.gray)
                ScrollView {
                    ForEach(drops, id: \.self) { drop in
                        HStack {
                            Text(drop.capitalized)
                                .font(.body)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                    }
                    .padding(.bottom, 15)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            .frame(width: UIScreen.main.bounds.width - 150)
            .padding(.horizontal)
            .padding(.top)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding(.bottom, 40)
            .padding(.top, 10)
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0.5)
                    .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
            }
        }
    }
}

