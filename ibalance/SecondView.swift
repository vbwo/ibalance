//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Color.background
                VStack {
                    ZStack {
                        Image("logo")
                    }.frame(width: 393, height: 172)
                    IntroPage(image: "perfeito",
                              firsttext: Text("Agora, **defina o tempo que você quer que \nseus filhos passem no celular diariamente.**"),
                              secondtext: Text("Você pode definir tempos diferentes para \ncada dia da semana também."),
                              command: "Tempo no celular por dia:",
                              width: 315,
                              padding: 0)
                    
                    HStack{
                        
                        BackButton()
                        
                        Spacer()
                        
                        AdvanceButton(width: 152, text: "Avançar")
                    } .frame(width: 345)
                    
                    Spacer()
                }
            } .ignoresSafeArea()
        }
    }
}

struct BackButton: View {
    var body: some View {
        Button(action: {}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.orangebalance, lineWidth: 1)                  .frame(width: 152, height: 40)
                
                Text("Voltar")
                    .foregroundStyle(.orangebalance)
                    .font(Font.custom("Nunito-Regular", size: 17)
                    )
            }
        })
    }
}

#Preview {
    SecondView()
}
