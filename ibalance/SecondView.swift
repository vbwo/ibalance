//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct SecondView: View {
    
    @Binding var screen: Int
    @Binding var colors: [Color]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Image("logo")
                }
                .frame(width: 393, height: 172)
                IntroPage(
                    image: "perfeito",
                    firsttext: Text("Agora, **defina o tempo que você quer que \nseus filhos passem no celular diariamente.**"),
                    secondtext: Text("Você pode definir tempos diferentes para \ncada dia da semana também."),
                    command: "Tempo no celular por dia:",
                    width: 315,
                    padding: 0
                )
                .padding(.top, -19)
                
                HStack {
                    BackButton(current: $screen,
                               colors: $colors)
                    Spacer()
                    AdvanceButton(
                        width: 152,
                        text: "Avançar",
                        current: $screen,
                        colors: $colors
                    )
                }
                .frame(width: 345)
                
                Spacer()
            }
            
            .frame(height: 780)
            .ignoresSafeArea()
            .background(Color.background)
        }
    }
}

