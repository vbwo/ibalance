//
//  IntroPageView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 16/05/24.
//

import SwiftUI

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
