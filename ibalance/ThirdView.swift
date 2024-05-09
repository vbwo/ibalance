//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Color.background
                VStack {
                    ZStack {
                        Image("logo")
                    }.frame(width: 393, height: 172)
                    IntroPage(image: "quase",
                              firsttext: Text("Por fim, **adicione as prioridades de uso de \ncategorias de aplicativos aos seus filhos.**"),
                              secondtext: Text("Assim, podemos calcular o tempo a ser\ngasto em cada uma."),
                              command: "Prioridade por categoria de app:",
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

#Preview {
    ThirdView()
}
