//
//  FourthView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct ResultView: View {
    
    var body: some View {
        
        VStack {
            ResultText(text: "Resultado:",
                       font: "Nunito-Bold",
                       size: 32)
            .padding(.bottom, 36)
            .padding(.trailing, 185)
            
            
            ResultArea(kidText: "Filho 01",
                       selectionColor: .purplebalance,
                       textColor: .black,
                       studyTime: "1h",
                       gameTime: "35min",
                       socialTime: "25min")
            
            Spacer()
            
        }
    }
}

struct ResultText: View {
    
    var text: String
    var font: String
    var size: CGFloat
    
    var body: some View {
        Text("\(text)")
            .font(Font.custom("\(font)",
                              size: size))
    }
}

struct ResultArea: View {
    
    var kidText: String
    var selectionColor: Color
    var textColor: Color
    var studyTime: String
    var gameTime: String
    var socialTime: String
    @State private var selectedDayIndex: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                ResultText(text: "\(kidText)",
                           font: "Nunito-Bold",
                           size: 24)
                .padding(.bottom, 16)
                
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
            } .frame(width: 338)
            
            Image("tempo")
                .zIndex(1.0)
                .offset(x: 12, y: 12)
            ZStack(alignment: .leading){
                VStack(alignment: .leading, spacing: -4){
                    HStack {
                        Text("Estudos:")
                            .font(Font.custom("Nunito-Medium",
                                              size: 16))
                        Text("\(studyTime)")
                            .font(Font.custom("Nunito-Light",
                                              size: 16))
                    }
                    HStack {
                        Text("Jogos:")
                            .font(Font.custom("Nunito-Medium",
                                              size: 16))
                        Text("\(gameTime)")
                            .font(Font.custom("Nunito-Light",
                                              size: 16))
                    }
                    HStack {
                        Text("Redes sociais:")
                            .font(Font.custom("Nunito-Medium",
                                              size: 16))
                        Text("\(socialTime)")
                            .font(Font.custom("Nunito-Light",
                                              size: 16))
                    }
                } .padding(.leading, 15)
                    .padding(.top, 4)
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.bluebalance, lineWidth: 1.5)
                    .shadow(color: .black.opacity(0.25), radius: 7.5, x: 0, y: 0)
                    .frame(width: 338, height: 83)
                    .padding(.bottom, 4)
                
            }
            
            Image("pausas")
                .zIndex(1.0)
                .offset(x: 12, y: 10)
            
            ZStack(alignment: .leading){
                VStack(alignment: .leading, spacing: -4){
                    
                    Text("10min a cada 30min de estudos;")
                        .font(Font.custom("Nunito-Light",
                                          size: 16))
                    Text("5min a cada 17min de jogos.")
                        .font(Font.custom("Nunito-Light",
                                          size: 16))
                    
                } .padding(.leading, 15)
                    .padding(.top, 8)
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.purplebalance, lineWidth: 1.5)
                    .shadow(color: .black.opacity(0.25), radius: 7.5, x: 0, y: 0)
                    .frame(width: 338, height: 71)
            }
        }
    }
}

#Preview {
    ResultView()
}
