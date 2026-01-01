import SwiftUI

struct HyrulepediaGameSelectorScreen: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Image("app-title-tan")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(.bottom, 32)
                Text("Choose game")
                    .font(.custom("HyliaSerifBeta-Regular", size: 35))
                    .shadow(color: .customGold.opacity(0.6), radius: 3)
                    .shadow(color: .customGold.opacity(0.4), radius: 5)
                HStack(spacing: 24) {
                    VStack {
                        Image("botw-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .onTapGesture {
                                coordinator.push(.breathOfTheWild)
                            }
                    }
                    VStack {
                        Image("totk-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .onTapGesture {
                                coordinator.push(.tearsOfTheKingdom)
                            }
                    }
                }
                Spacer()
                HStack {
                    Text("API by")
                    Link("gadhagod", destination: URL(string: "https://gadhagod.github.io/Hyrule-Compendium-API/#/")!)
                        .italic()
                        .bold()
                        .underline()
                }
                HStack {
                    Text("Resources by")
                    Link("Hunter Paramore", destination: URL(string: "https://admiregd.com/zelda-breath-of-the-wild-ui-kit")!)
                        .italic()
                        .bold()
                        .underline()
                }
                HStack {
                    Text("Desing inspired by")
                    Link("Basti UI Zeld'App", destination: URL(string: "https://www.figma.com/community/file/1247926937471212468/bastiui-zeldapp-zelda-botw-totk-iphone-app")!)
                        .italic()
                        .bold()
                        .underline()
                }
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .foregroundStyle(Color.customWhite)
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
