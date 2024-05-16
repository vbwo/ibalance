//
//  ButtonView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 16/05/24.
//

import SwiftUI

struct AdvanceButton: View {
    
    var width: CGFloat
    var text: String
    @Binding var current: Int
    @Binding var colors: [Color]
    
    var body: some View {
        Button(action: {
            
            if current <= 2{
                colors[current] = .lightpurplebalance
                colors[current + 1] = .purplebalance
                current += 1
                print(current)
            }
            
        },
               label: {
            ZStack {
                Rectangle()
                    .foregroundStyle(.orangebalance)
                    .frame(width: width, height: 40)
                    .cornerRadius(6)
                Text(text)
                    .foregroundStyle(.white)
                    .font(Font.custom("Nunito-SemiBold", size: 17)
                        .weight(.semibold))
            }
        })
    }
}

struct BackButton: View {
    
    @Binding var current: Int
    @Binding var colors: [Color]
     
    var body: some View {
        Button(action: {
            
            if current <= 2{
                colors[current] = .lightpurplebalance
                colors[current - 1] = .purplebalance
                current -= 1
                print(current)
            }
        },
               label: {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.orangebalance, lineWidth: 1)
                    .frame(width: 152, height: 40)
                
                Text("Voltar")
                    .foregroundStyle(.orangebalance)
                    .font(Font.custom("Nunito-Regular", size: 17)
                    )
            }
        })
    }
}
