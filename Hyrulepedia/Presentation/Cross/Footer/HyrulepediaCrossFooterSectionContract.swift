//
//  HyrulepediaCrossFooterSectionContract.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 11/12/25.
//

import Combine

/// A lightweight contract for `HyrulepediaCrossFooterSectionView`
///
/// Conforming types are expected to be `ObservableObject`s so SwiftUI views
/// can observe and react to published changes.
protocol HyrulepediaCrossFooterSectionContract: ObservableObject {
    /// Indicates whether the owning feature is currently loading data.
    var isLoading: Bool { get }
    /// The current free‑text query used by the footer's search field.
    var searchText: String { get set }
    /// The currently selected category identifier that scopes the search/filter.
    var listCategory: String { get set }
}
