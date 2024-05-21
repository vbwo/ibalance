//
//  ThirdView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct ThirdView: View {
    
    @State var selection: String? = nil
    @State var selection2: String? = nil
    @EnvironmentObject var sharedData: SharedData
    @State private var selectedDayIndex: Int? = nil

    var body: some View {
        
        VStack {
            VStack {
                IntroPage(image: "quase",
                          firsttext: Text("Por fim, **adicione as prioridades de cada \ncategoria de aplicativo aos seus filhos.**"),
                          secondtext: Text("Assim, podemos calcular o tempo a ser\ngasto em cada uma."),
                          command: "Prioridade por categoria de app:",
                          width: 315,
                          padding: 0)
                .padding(.top, -5)
                
                HStack {
                    DropdownView(
                        selection: $sharedData.selectedChild,
                        options: sharedData.childOptions,
                        menuTitle: "Filho 01",
                        menuWidth: 114
                    )
                    
                    Spacer()
                    
                    ForEach(Array(zip(["D", "S", "T", "Q", "Q", "S", "S"].indices, ["D", "S", "T", "Q", "Q", "S", "S"])), id: \.0) { index, day in
                        Button(action: {
                            selectedDayIndex = index
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(width: 24)
                                    .foregroundStyle(selectedDayIndex == index ? .purplebalance : .lightpurplebalance)
                                Text(day)
                                    .foregroundStyle(selectedDayIndex == index ? .white : .black)
                                    .font(Font.custom("Nunito-Regular", size: 12))
                            }
                        })
                    }
                }
                .frame(width: 345)
                .padding(.bottom, 20)
            } .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            HStack {
                
                DropdownView(selection: $selection,
                             options: ["Estudos", "Jogos", "Redes sociais"],
                             menuTitle: "Categorias",
                             menuWidth: 148
                )
                
                Spacer()
                
                DropdownView(selection: $selection2,
                             options: ["Máxima", "Média", "Mínima"],
                             menuTitle: "Prioridade",
                             menuWidth: 148
                )
                
                Spacer()
                
                Button(action: {
                   
                }, label: {
                    ZStack {
                        Circle()
                            .frame(width: 24)
                            .foregroundStyle(Color.orangebalance)
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                })
            }
            .frame(width: 345)
            .padding(.top, -5)
            
            Spacer()
        }
        .environmentObject(sharedData)
    }
}

#Preview {
    ThirdView().environmentObject(SharedData())
}
