//
//  ContentView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var current: Int = 0
    @State var colors: [Color] = [.purplebalance, .lightpurplebalance, .lightpurplebalance]
    @State var selection1: String? = nil
      
    var body: some View {
        VStack {
            if (current == 0) {
                GeometryReader{geo in
                    VStack { 
                        ZStack { 
                            Image("logo")
                                .padding(.top, 19)
                        }.frame(width: 393, height: 153)
                        IntroPage(image: "ola",
                                  firsttext: Text("Promova um uso **equilibrado de telas** \naos seus filhos."),
                                  secondtext: Text("Para isso, **comece respondendo a \nseguinte questão:**"),
                                  command: "Quantos filhos você tem?",
                                  width: 275,
                                  padding: 35)
                        
                        DropdownView(
                            selection: $selection1,
                            options: [
                                "01",
                                "02",
                                "03",
                                "04",
                                "05"
                            ]
                        )
                        .padding(.trailing, 255)
                        
                        Spacer()
                        
                        
                        AdvanceButton(width: 345,
                                      text: "Avançar",
                                      current: $current,
                                      colors: $colors)
                        
                    }
                    .frame(height: 780)
                    .ignoresSafeArea()
                    .background(Color.background)
                    
                }
            } else if (current == 1) {
                SecondView(screen: $current, colors:  $colors)
            } else if (current == 2) {
                ThirdView(screen: $current, colors:  $colors)
            } 

            PageStatus(current: $current, colors: $colors)
        } 
    }
}


#Preview {
    ContentView()
}
