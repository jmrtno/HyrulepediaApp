import Combine

/// A lightweight contract for `HyrulepediaCrossLoaderSectionView`
///
/// Conforming types are expected to be `ObservableObject`s so SwiftUI views
/// can observe and react to published changes.
protocol HyrulepediaCrossLoaderSectionContract: ObservableObject {
    /// Indicates whether the owning feature is currently loading data.
    var isLoading: Bool { get }
}
