import SwiftUI

struct ContentView: View {
    
    @State var current: Int = 0
    @State var colors: [Color] = [.purplebalance, .lightpurplebalance, .lightpurplebalance, .lightpurplebalance]
    @Binding var screen: Int
    @State private var showAlert = false
    @State private var alertMessage1 = ""
    @State private var alertMessage2 = ""
    @State var hours: [Int] = [0, 0, 0, 0, 0, 0, 0]
    @State var minutes: [Int] = [0, 0, 0, 0, 0, 0, 0]
    @State var selectedOptions: [[String?]] = Array(repeating: [nil, nil, nil], count: 7)
    @State var result: [[String]] = Array(repeating: ["", "", ""], count: 7)
    @Binding var selectedDayIndex: Int
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    
                    Image("logo")
                        .padding(.top, 80)
                        .padding(.bottom, 40)
                    
                    TabView(selection: $current) {
                        FirstView(hours: $hours,
                                  minutes: $minutes)
                        .tag(0)
                        SecondView(selectedOptions: $selectedOptions,
                                   hours: $hours,
                                   minutes: $minutes)
                        .tag(1)
                        .padding(.top, -4)
                        ResultView(result: $result,
                                   hours: $hours,
                                   minutes: $minutes)
                        .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .highPriorityGesture(DragGesture())
                    
                    Spacer()
                    
                    HStack {
                        if current == 0 {
                            AdvanceButton(width: 345,
                                          text: "Avançar",
                                          current: $current,
                                          colors: $colors,
                                          showAlert: $showAlert,
                                          alertMessage1: $alertMessage1,
                                          alertMessage2: $alertMessage2,
                                          hours: $hours,
                                          minutes: $minutes,
                                          checkHoursAndMinutes: true,
                                          selectedOptions: $selectedOptions,
                                          result: $result)
                        } else if current == 1 {
                            HStack {
                                BackButton(current: $current,
                                           colors: $colors)
                                Spacer()
                                AdvanceButton(width: 152,
                                              text: "Calcular",
                                              current: $current,
                                              colors: $colors,
                                              showAlert: $showAlert,
                                              alertMessage1: $alertMessage1,
                                              alertMessage2: $alertMessage2,
                                              hours: $hours,
                                              minutes: $minutes,
                                              checkHoursAndMinutes: false,
                                              selectedOptions: $selectedOptions,
                                              result: $result)
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
            if current == 0 {
                return Alert(
                    title: Text("Atenção"),
                    message: Text(alertMessage1),
                    primaryButton: .default(Text("Sim")) {
                        colors[current] = .lightpurplebalance
                        colors[current + 1] = .purplebalance
                        current += 1
                    },
                    secondaryButton: .cancel(Text("Não"))
                )
            } else if current == 1 {
                return Alert(
                    title: Text("Atenção"),
                    message: Text(alertMessage2),
                    dismissButton: .default(Text("OK"))
                )
            } else {
                return Alert(title: Text(""))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: .constant(2), selectedDayIndex: .constant(0))
    }
}
