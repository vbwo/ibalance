import SwiftUI

struct ContentView: View {
    
    @State var current: Int = 0
    @State var colors: [Color] = [.purplebalance, .lightpurplebalance, .lightpurplebalance, .lightpurplebalance]
    @Binding var screen: Int
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State var hours: [Int] = [0, 0, 0, 0, 0, 0, 0]
    @State var minutes: [Int] = [0, 0, 0, 0, 0, 0, 0]
    
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    
                    Image("logo")
                        .padding(.top, 80)
                        .padding(.bottom, 40)
                    
                    TabView(selection: $current) {
                        FirstView(hours: $hours, minutes: $minutes)
                            .tag(0)
                        SecondView(hours: $hours, minutes: $minutes)
                            .tag(1)
                        ResultView()
                            .tag(2)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .indexViewStyle(.page(backgroundDisplayMode: .never))
                     
                    Spacer()
                    
                    HStack {
                        if current == 0 {
                            AdvanceButton(width: 345,
                                          text: "Avançar",
                                          current: $current,
                                          colors: $colors,
                                          showAlert: $showAlert,
                                          alertMessage: $alertMessage,
                                          hours: $hours,
                                          minutes: $minutes,
                                          checkHoursAndMinutes: true)
                        } else if current == 1 {
                            HStack {
                                BackButton(current: $current,
                                           colors: $colors)
                                Spacer()
                                AdvanceButton(width: 152,
                                              text: "Avançar",
                                              current: $current,
                                              colors: $colors,
                                              showAlert: $showAlert,
                                              alertMessage: $alertMessage,
                                              hours: $hours,
                                              minutes: $minutes,
                                              checkHoursAndMinutes: false)
                            }
                            .frame(width: 345)
                        } else if current == 2 {
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
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Atenção"),
                message: Text(alertMessage),
                primaryButton: .default(Text("Sim")) {
                    colors[current] = .lightpurplebalance
                    colors[current + 1] = .purplebalance
                    current += 1
                },
                secondaryButton: .cancel(Text("Não"))
            )
        }
    }
}

#Preview {
    ContentView(screen: .constant(2))
}
