//
//  ContentView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Color.background
                VStack {
                    ZStack {
                        Image("logo")
                    }.frame(width: 393, height: 153)
                    IntroPage(image: "ola",
                              firsttext: Text("Promova um uso **equilibrado de telas** \naos seus filhos."),
                              secondtext: Text("Para isso, **comece respondendo a \nseguinte questão:**"),
                              command: "Quantos filhos você tem?",
                              width: 275,
                              padding: 35)
                    
                    MainButton(width: 345,
                                    text: "Avançar")
                    Spacer()
                }
            } .ignoresSafeArea()
        }
    }
}

struct IntroPage: View {
    
    var image: String
    var firsttext: Text
    var secondtext: Text
    var command: String
    var width: CGFloat
    var padding: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: -10){
            
            Image(image)
                .zIndex(2.0)
                .offset(x: 12)
            ZStack{
                Rectangle()
                    .foregroundStyle(.bluebalance)
                    .frame(width: 345, height: 124)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.25), radius: 7.5, x: 0, y: 0)
                VStack(alignment: .leading, spacing: 8){
                    firsttext
                    secondtext
                }
                .font(Font.custom("Nunito-Medium", size: 16))
                .foregroundColor(.white)
                .frame(width: width, height: 96, alignment: .topLeading)
                .padding(.trailing, padding)
                .padding(.top, 4)
            }
            
            Text(command)
                .font(Font.custom("Nunito-Bold", size: 20))
                .foregroundColor(.darkbluebalance)
                .padding(.top, 32)
        }
    }
}

struct MainButton: View {
    
    var width: CGFloat
    var text: String
    
    var body: some View {
        Button(action: {}, label: {
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

#Preview {
    ContentView()
}
