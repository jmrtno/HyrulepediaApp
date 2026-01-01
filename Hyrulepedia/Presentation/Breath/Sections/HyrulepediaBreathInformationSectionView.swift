import Combine
import Kingfisher
import SwiftUI

struct HyrulepediaBreathInformationSectionView: View {
    // MARK: Modular Variable
    @EnvironmentObject var viewModel: HyrulepediaBreathViewModel
    
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
                HyrulepediaDetailScreen(itemId: item.id, gameId: "1")
                    .presentationDragIndicator(.visible) 
            }
    }
}

// MARK: - Private UI

private extension HyrulepediaBreathInformationSectionView {
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
            VStack(alignment: .leading) {
                HStack {
                    itemEdible(item: item)
                    itemCookingEffect(item: item)
                }
                itemProperties(item: item)
            }
        }
    }

    @ViewBuilder
    func itemEdible(item: HyrulepediaDataEntity) -> some View {
        if item.edible == true || item.category == "materials" {
            heartRow(hearts: Double(item.heartsRecovered ?? 0.0))
        }
    }

    @ViewBuilder
    func heartRow(hearts: Double) -> some View {
        let filledHearts = Int(hearts)
        let hasHalfHeart = abs(hearts - Double(filledHearts) - 0.5) < 0.01
        HStack(spacing: 2) {
            if abs(hearts - 0.25) < 0.01 {
                heartImage(image: "heartQuarter")
            } else if hearts == 0.0 {
                heartImage(image: "heart")
            } else {
                ForEach(0..<filledHearts, id: \.self) { _ in
                    heartImage(image: "heartFill")
                }
                if hasHalfHeart {
                    heartImage(image: "heartHalf")
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .border(.white.opacity(0.3), width: 1)
        .padding(3)
        .background(.black)
    }
    
    func heartImage(image: String) -> some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25)
    }
    
    @ViewBuilder
    func itemCookingEffect(item: HyrulepediaDataEntity) -> some View {
        let cookingEffectText = (item.cookingEffect ?? "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !cookingEffectText.isEmpty {
            Text(cookingEffectText.capitalized)
                .italic()
        }
    }

    @ViewBuilder
    func itemProperties(item: HyrulepediaDataEntity) -> some View {
        let attack = item.properties?.attack ?? 0
        let defense = item.properties?.defense ?? 0
        HStack {
            if attack != 0 {
                Image("attackIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                Text("\(attack)")
                    .italic()
            }
            if defense != 0 {
                Image("defenseIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                Text("\(defense)")
                    .italic()
            }
        }
    }
}
