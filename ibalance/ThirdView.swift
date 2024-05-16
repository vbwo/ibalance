//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct ThirdView: View {
    
    @Binding var screen: Int
    @Binding var colors: [Color]
    
    var body: some View {
        GeometryReader{geo in
            VStack {
                ZStack {
                    Image("logo")
                }.frame(width: 393, height: 172)
                IntroPage(image: "quase",
                          firsttext: Text("Por fim, **adicione as prioridades de cada \ncategoria de aplicativo aos seus filhos.**"),
                          secondtext: Text("Assim, podemos calcular o tempo a ser\ngasto em cada uma."),
                          command: "Prioridade por categoria de app:",
                          width: 315,
                          padding: 0)
                .padding(.top, -24)
                
                HStack{
                    
                    BackButton(current: $screen,
                               colors: $colors)
                    
                    Spacer()
                    
                    AdvanceButton(width: 152,
                                  text: "Avançar",
                                  current: $screen,
                                  colors: $colors)
                    
                } .frame(width: 345)
                
                Spacer()
            }
            .frame(height: 780)
            .ignoresSafeArea()
            .background(Color.background)
        }
    }
}
