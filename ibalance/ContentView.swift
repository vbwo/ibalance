import SwiftUI

struct ContentView: View {
    
    @State var current: Int = 0
    @State var colors: [Color] = [.purplebalance, .lightpurplebalance, .lightpurplebalance, .lightpurplebalance]
    @Binding var screen: Int
    @EnvironmentObject var sharedData: SharedData
    
    var children: [Child] = []
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    
                    Image("logo")
                        .padding(.top, 80)
                        .padding(.bottom, 40)
                    
                    TabView(selection: $current) {
                        FirstView()
                            .tag(0)
                            .environmentObject(self.sharedData)
                        SecondView()
                            .tag(1)
                            .environmentObject(self.sharedData)
                        ThirdView()
                            .tag(2)
                            .environmentObject(self.sharedData)
                        ResultView()
                            .tag(3)
                            .environmentObject(self.sharedData)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .indexViewStyle(.page(backgroundDisplayMode: .never))
                    
                    Spacer()
                    
                    HStack {
                        if current == 0 {
                            AdvanceButton(width: 345,
                                          text: "Avançar",
                                          current: $current,
                                          colors: $colors)
                        } else if current == 1 || current == 2 {
                            HStack {
                                BackButton(current: $current,
                                           colors: $colors)
                                Spacer()
                                AdvanceButton(width: 152,
                                              text: "Avançar",
                                              current: $current,
                                              colors: $colors)
                            }
                            .frame(width: 345)
                        } else if current == 3 {
                            ConcludeButton(current: $current,
                                           colors: $colors,
                                           width: 345,
                                           text: "Concluir")
                        }
                    }
    
                }
                .frame(height: 780)
                .ignoresSafeArea()
                .background(Color.background)
            }
            PageStatus(current: $current, colors: $colors)
        }
        
    }
}

#Preview {
    ContentView(screen: .constant(2)).environmentObject(SharedData())
}
