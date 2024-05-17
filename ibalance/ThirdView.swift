//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct ThirdView: View {
    
    @State var selection: String? = nil
    @State var selection2: String? = nil
    
    var body: some View {
        
        VStack {
            
            IntroPage(image: "quase",
                      firsttext: Text("Por fim, **adicione as prioridades de cada \ncategoria de aplicativo aos seus filhos.**"),
                      secondtext: Text("Assim, podemos calcular o tempo a ser\ngasto em cada uma."),
                      command: "Prioridade por categoria de app:",
                      width: 315,
                      padding: 0)
            .padding(.top, -5)
            
            
            HStack {
                
                DropdownView(selection: $selection,
                             options: [ "Estudos",
                                        "Jogos",
                                        "Redes sociais"
                                      ],
                             menuTitle: "Categorias",
                             menuWidth: 148
                )
                
                Spacer()
                
                DropdownView(selection: $selection2,
                             options: [ "Máxima",
                                        "Média",
                                        "Mínima"
                                      ],
                             menuTitle: "Prioridade",
                             menuWidth: 148
                )
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    ZStack{
                        Circle()
                            .frame(width: 24)
                            .foregroundStyle(Color.orangebalance)
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                })
                
            } .frame(width: 345)
            
            Spacer()
            
        }
        
    }
}
