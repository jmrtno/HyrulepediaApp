//
//  HyrulepediaGameSelectorScreen.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 29/11/25.
//


import SwiftUI

struct HyrulepediaGameSelectorScreen: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Home Game Selector")
                    .foregroundStyle(.white)
                Button("Go to Breath of the Wild") {
                    coordinator.push(.breathOfTheWild)
                }
                Button("Go to Tears of the Kingdom") {
                    coordinator.push(.tearsOfTheKingdom)
                }
            }
        }
    }
}



private extension HyrulepediaGameSelectorScreen {
    struct BackgroundView: View {
        var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black,
                                                Color.black,
                                                Color.black,
                                                Color(red: 0,
                                                      green: 0.5,
                                                      blue: 0)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Image("bgTexture")
                    .resizable()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HyrulepediaGameSelectorScreen()
}

