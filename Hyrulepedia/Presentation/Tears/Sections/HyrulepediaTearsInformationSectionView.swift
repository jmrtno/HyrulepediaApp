import Combine
import Kingfisher
import SwiftUI

struct HyrulepediaTearsInformationSectionView: View {
    // MARK: Modular Variable
    @EnvironmentObject var viewModel: HyrulepediaTearsViewModel
    
    // MARK: Environments & State
    
    @State private var selectedItem: HyrulepediaDataEntity? = nil
    
    private var selectedCategory: String {
        viewModel.listCategory
    }
    
    private var searchedText: String {
        viewModel.searchText
    }

    var body: some View {
        contentView
            .sheet(item: $selectedItem) { item in
                HyrulepediaDetailScreen(itemId: item.id, gameId: "2")
                    .presentationDragIndicator(.visible)
            }
    }
}

// MARK: - Private UI

private extension HyrulepediaTearsInformationSectionView {
    @ViewBuilder
    var contentView: some View {
        if !viewModel.isLoading {
            getListView()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func getListView() -> some View {
        let filteredAndSearchedItems = viewModel.items
            .filter { item in
                item.category == selectedCategory && (searchedText.isEmpty ||
                                                      item.name.localizedCaseInsensitiveContains(searchedText))
            }
            .sorted { $0.id < $1.id }
        
        VStack (alignment: .center) {
            Text(selectedCategory.capitalized)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(alignment: .leading)
            ForEach(filteredAndSearchedItems, id: \.id) { item in
                getItemView(item: item)
                    .padding(.bottom, 20)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
    
    @ViewBuilder
    func getItemView(item: HyrulepediaDataEntity) -> some View {
        Button(action: {
            selectedItem = item
        }, label: {
            VStack(alignment: .leading) {
                getImageView(item: item)
                getSubtitleView(item: item)
            }
        })
    }
    
    @ViewBuilder
    func getImageView(item: HyrulepediaDataEntity) -> some View {
        ZStack {
            KFImage(URL(string: item.image))
                .resizable()
                .placeholder{
                    ProgressView()
                }
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    Text("#" + String(item.id))
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .foregroundStyle(.white.opacity(0.7))
                        .padding([.bottom, .trailing], 10),
                    alignment: .bottomTrailing
                )
        }
    }
    
    @ViewBuilder
    func getSubtitleView(item: HyrulepediaDataEntity) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(item.name.capitalized)
                    .font(.title2)
                    .fontWeight(.bold)
                    .italic()
                Spacer()
                Text("dlc")
                    .font(.title2)
                    .foregroundStyle(item.dlc ? .white : .white.opacity(0.3))
                    .fontWeight(.bold)
                    .italic()
            }
            HStack {
                if item.edible ?? false || item.category == "materials" {
                    HStack(spacing: 2) {
                        ForEach(0..<(max(Int(item.heartsRecovered ?? 0.0), 1)), id: \.self) { index in
                            Image(index < Int(item.heartsRecovered ?? 0.0) ? "heartFill" : "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 7)
                    .border(.white.opacity(0.3), width: 1)
                    .padding(3)
                    .background(.black)
                }
                
                let cookingEffectText = (item.cookingEffect ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                if !cookingEffectText.isEmpty {
                    Text(cookingEffectText.capitalized)
                        .italic()
                }
            }
        }
    }
}

