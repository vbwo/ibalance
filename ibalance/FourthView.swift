//
//  FourthView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct FourthView: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Color.background
                VStack {
                    ZStack {
                        Image("logo")
                    }.frame(width: 393, height: 172)
                    
                    VStack(alignment: .leading){
                        Text("Resultado:")
                            .foregroundStyle(.black)
                            .font(Font.custom("Nunito-Bold", 
                                              size: 32))
                        MainButton(width: 345, 
                                   text: "Concluir")
                    }
                    Spacer()
                }
            } .ignoresSafeArea()
        }
    }
}

#Preview {
    FourthView()
}
