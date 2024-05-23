//
//  FirstView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 16/05/24.
//

import SwiftUI

struct FirstView: View {
    
    @State private var selectedDayIndex: Int = 0
    @Binding var hours: [Int]
    @Binding var minutes: [Int]
    
    var body: some View {
        VStack {
            IntroPage(
                image: "ola",
                firsttext: Text("Promova um uso **equilibrado de telas** \nao seu filho."),
                secondtext: Text("Comece definindo o **tempo que ele \npassará no celular a cada dia.**"),
                command: "Escolha o tempo para cada dia:",
                width: 315,
                padding: 0,
                padtop: 4
            )
            .zIndex(4)
            
            Spacer()
            
            VStack {
                DaysView(selectedDayIndex: $selectedDayIndex)
                
                Divider()
                    .frame(width: 345)
                    .padding(.top, 16)
                
                Text("\(getDayOfWeek(selectedDayIndex)), o tempo máximo é: \(hours[selectedDayIndex])h \(minutes[selectedDayIndex])min")
                    .font(Font.custom("Nunito-Medium", size: 16))
                    .foregroundStyle(Color.darkpurplebalance)
                    .padding(.top, 16)
                
                ZStack {
                    HStack {
                        Picker(selection: $hours[selectedDayIndex], label: Text("Horas")) {
                            ForEach(0..<24) { hour in
                                Text("\(hour)h")
                                    .tag(hour)
                                    .padding(.leading, 50)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 200)
                        .offset(x: 22)
                        
                        Picker(selection: $minutes[selectedDayIndex], label: Text("Minutos")) {
                            ForEach(0..<60) { minute in
                                Text("\(minute)min")
                                    .tag(minute)
                                    .padding(.trailing, 50)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 200)
                        .offset(x: -22)
                    }
                    .frame(height: 140)
                    
                    Rectangle()
                        .foregroundStyle(Color.graybalance)
                        .frame(width: 20, height: 31)
                }
                .padding(.top, -10)
            }
            .padding(.top, -375)
        }  .frame(width: 345)
            .background(Color.background.opacity(0.01))
            .highPriorityGesture(DragGesture())
        Spacer()
    }
}

private func getDayOfWeek(_ index: Int) -> String {
    let daysOfWeek = ["domingos", "segundas", "terças", "quartas", "quintas", "sextas", "sábados"]
    let articles = ["Aos", "Às", "Às", "Às", "Às", "Às", "Aos"]
    return "\(articles[index]) \(daysOfWeek[index])"
}

struct DaysView: View {
    
    @Binding var selectedDayIndex: Int
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(Array(zip(["D", "S", "T", "Q", "Q", "S", "S"]
                .indices, ["D", "S", "T", "Q", "Q", "S", "S"])), id: \.0) { index, day in
                    Button(action: {
                        selectedDayIndex = index
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(selectedDayIndex == index ? .purplebalance : .lightpurplebalance)
                            Text(day)
                                .foregroundStyle(selectedDayIndex == index ? .white : .black)
                                .font(Font.custom("Nunito-Regular", size: 14))
                        }
                    })
                }
        }
        .frame(width: 345)
        .padding(.top, 10)
    }
}

#Preview {
    FirstView(hours: .constant([0, 0, 0, 0, 0, 0, 0]), minutes: .constant([0, 0, 0, 0, 0, 0, 0]))
}
