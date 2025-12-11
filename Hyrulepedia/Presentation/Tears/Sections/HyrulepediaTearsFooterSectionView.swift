//
//  HyrulepediaTearsFooterSectionView.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 29/11/25.
//

import Combine
import SwiftUI

struct HyrulepediaTearsFooterSectionView: View {
    
    @EnvironmentObject var viewModel: HyrulepediaTearsViewModel
    
    @SwiftUI.State private var pickerCategories: PickerCategories = .creatures
    @SwiftUI.State private var searchText = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        contentView
            .onChange(of: searchText) { _, newValue in
                viewModel.searchText = newValue
            }
            .onChange(of: pickerCategories) { _, newValue in
                viewModel.listCategory = newValue.rawValue
            }
    }
}

private extension HyrulepediaTearsFooterSectionView {
    @ViewBuilder
    var contentView: some View {
        if !viewModel.isLoading {
            VStack {
                getSearchBar()
                getCategorySelector()
            }
            .padding()
        } else {
            EmptyView()
        }

    }
    @ViewBuilder
    func getSearchBar() -> some View {
        TextField(text: $searchText, label: {
            Text("Search")
                .foregroundColor(.white)
        })
        .foregroundColor(.white)
    }
    
    @ViewBuilder
    func getCategorySelector() -> some View {
        
        var backgroundColorSegmentedControl: Color {
            return colorScheme == .dark ? .gray.opacity(0.4) : .gray.opacity(0.14)
        }
        
        HStack {
            ForEach(PickerCategories.allCases, id: \.self) { option in
                Button {
                    pickerCategories = option
                } label: {
                    Image(pickerCategories == option ? option.systemImageNameSelected : option.systemImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                }
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 7))
            }
        }
        .background(backgroundColorSegmentedControl)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onChange(of: pickerCategories) {
            searchText = ""
        }
    }
}

private extension HyrulepediaTearsFooterSectionView {
    enum PickerCategories: String, CaseIterable, Identifiable {
        case creatures
        case monsters
        case materials
        case equipment
        case treasure

        var id: Self { self }

        var systemImageName: String {
            switch self {
            case .creatures:
                return "creatures"
            case .monsters:
                return "monsters"
            case .materials:
                return "materials"
            case .equipment:
                return "equipments"
            case .treasure:
                return "treasures"
            }
        }
        
        var systemImageNameSelected: String {
            switch self {
            case .creatures:
                return "creaturesFill"
            case .monsters:
                return "monstersFill"
            case .materials:
                return "materialsFill"
            case .equipment:
                return "equipmentsFill"
            case .treasure:
                return "treasuresFill"
            }
        }
    }
}
