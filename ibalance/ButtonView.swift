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
    @Binding var showAlert: Bool
    @Binding var alertMessage1: String
    @Binding var alertMessage2: String
    @Binding var hours: [Int]
    @Binding var minutes: [Int]
    var checkHoursAndMinutes: Bool = false
    @Binding var selectedOptions: [[String?]]
    @Binding var result: [[String]]
    
    @State var cantCalculate: Bool = false
    
    var body: some View {
        Button(action: {
            withAnimation {
                cantCalculate = false
                if current <= 3 {
                    if current == 1 {
                        for row in selectedOptions {
                            for col in row {
                                if col == nil {
                                    cantCalculate = true
                                    alertMessage2 = "Você precisa selecionar todas as prioridades dos dias da semana para calcular."
                                    showAlert = true
                                    break
                                }
                            }
                            if cantCalculate {
                                break
                            }
                        }
                        if !cantCalculate {
                            for i in 0...6 {
                                result[i] = calculateTimeForDay(dayIndex: i)
                            }
                            current += 1
                            colors[current - 1] = .lightpurplebalance
                            colors[current] = .purplebalance
                        }
                    } else {
                        if checkHoursAndMinutes {
                            let hasZeroHoursAndMinutes = zip(hours, minutes).contains { $0 == 0 && $1 == 0 }
                            if hasZeroHoursAndMinutes {
                                alertMessage1 = "Você tem pelo menos um dia da semana com \"0h00min\". Deseja avançar mesmo assim?"
                                showAlert = true
                            } else {
                                colors[current] = .lightpurplebalance
                                current += 1
                                colors[current] = .purplebalance
                            }
                        } else {
                            colors[current] = .lightpurplebalance
                            current += 1
                            colors[current] = .purplebalance
                        }
                    }
                }
            }
        }) {
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
        }
    }
    
    private func calculateTimeForDay(dayIndex: Int) -> [String] {
        let totalMinutes = (hours[dayIndex] * 60) + minutes[dayIndex]
        
        let priorities = ["Máxima": 0.55, "Média": 0.30, "Mínima": 0.15]
        var results: [String] = []
        
        let categories = ["Estudos", "Jogos", "Redes"]
        
        for (index, _) in categories.enumerated() {
            if let option = selectedOptions[dayIndex][index], let priority = priorities[option] {
                let categoryMinutes = Int(Double(totalMinutes) * priority)
                let hoursPart = categoryMinutes / 60
                let minutesPart = categoryMinutes % 60
                results.append("\(hoursPart)h \(minutesPart)min")
            }
        }
        
        return results
    }
}

struct BackButton: View {
    
    @Binding var current: Int
    @Binding var colors: [Color]
    
    var body: some View {
        Button(action: {
            withAnimation {
                if current <= 3 {
                    colors[current] = .lightpurplebalance
                    colors[current - 1] = .purplebalance
                    current -= 1
                }
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

struct ConcludeButton: View {
    
    @Binding var current: Int
    @Binding var colors: [Color]
    var width: CGFloat
    var text: String
    
    var body: some View {
        Button(action: {
            current = 0
            for i in 0..<colors.count {
                colors[i] = i == 0 ? .purplebalance : .lightpurplebalance
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
