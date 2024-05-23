//
//  FourthView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var result: [[String]]
    @State private var selectedDayIndex: Int = 0
    @Binding var hours: [Int]
    @Binding var minutes: [Int]
    
    var body: some View {
        
        VStack {
            
            IntroPage(image: "perfeito",
                      firsttext: Text("Pronto! **Seu calculo está concluído.**"),
                      secondtext: Text("Confira abaixo o resultado \nde acordo com os tempos que selecionou por dia. "),
                      command: "Resultado:",
                      width: 315,
                      padding: 0)
            
            DaysAndHoursView(selectedDayIndex: $selectedDayIndex, hours: $hours, minutes: $minutes)
            
            Divider()
                .frame(width: 345)
                .padding(.top, 16)
            
            VStack(alignment: .leading, spacing: 4) {
                Image("tempo")
                    .zIndex(1.0)
                    .offset(x: 12, y: 12)
                ZStack(alignment: .leading){
                    VStack(alignment: .leading, spacing: -4){
                        HStack {
                            Text("Estudos:")
                                .font(Font.custom("Nunito-Medium",
                                                  size: 16))
                            Text("\(result[selectedDayIndex][0])")
                                .font(Font.custom("Nunito-Light",
                                                  size: 16))
                        }
                        HStack {
                            Text("Jogos:")
                                .font(Font.custom("Nunito-Medium",
                                                  size: 16))
                            Text("\(result[selectedDayIndex][1])")
                                .font(Font.custom("Nunito-Light",
                                                  size: 16))
                        }
                        HStack {
                            Text("Redes:")
                                .font(Font.custom("Nunito-Medium",
                                                  size: 16))
                            Text("\(result[selectedDayIndex][2])")
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
                VStack(alignment: .leading) {
                    
                    if ShortBreakMessage() {
                        
                        Image("dica")
                            .zIndex(1.0)
                            .offset(x: 12, y: 14)
                        ZStack{
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.purplebalance, lineWidth: 1.5)
                                .shadow(color: .black.opacity(0.25), radius: 7.5, x: 0, y: 0)
                                .frame(width: 338, height: 56)
                                .padding(.bottom, 4)
                            HStack {
                                Text("Importante descansar 5min a cada 20min.")
                                    .font(Font.custom("Nunito-Light", size: 16))
                                    .foregroundColor(.black)
                                
                            } .padding(.trailing, 12)
                                .padding(.top, 2)
                        }
                    }
                }
                
                Spacer()
                
            }
        }
        .background(Color.background.opacity(0.01))
        .highPriorityGesture(DragGesture())
    }
    
    private func ShortBreakMessage() -> Bool {
        for time in result[selectedDayIndex] {
            if let minutes = extractMinutes(from: time), minutes >= 40 {
                return true
            }
        }
        return false
    }
    
    private func extractMinutes(from time: String) -> Int? {
        let parts = time.split(separator: "h")
        guard parts.count == 2,
              let hours = Int(parts[0].trimmingCharacters(in: .whitespaces)),
              let minutesPart = parts[1].split(separator: "min").first,
              let minutes = Int(minutesPart.trimmingCharacters(in: .whitespaces))
        else {
            return nil
        }
        return hours * 60 + minutes
    }
}

