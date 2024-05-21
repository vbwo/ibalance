//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var sharedData: SharedData
    @State private var selectedDayIndex: Int = 0
    @State var childrenIndex: Int = 0
    
    @State var hours: [Int] = [0,0,0,0,0,0,0]
    @State var minutes: [Int] = [0,0,0,0,0,0,0]
    
    var body: some View {
        VStack {
            VStack {
                IntroPage(
                    image: "perfeito",
                    firsttext: Text("Agora, **defina o tempo que você quer que \nseus filhos passem no celular diariamente.**"),
                    secondtext: Text("Você pode definir tempos diferentes para \ncada dia da semana também."),
                    command: "Tempo no celular por dia:",
                    width: 315,
                    padding: 0
                )
                
                HStack {
                    DropdownView(
                        selection: $sharedData.selectedChild,
                        options: sharedData.childOptions,
                        menuTitle: "Filho 01",
                        menuWidth: 114
                    )
                    .zIndex(1)
                    .onChange(of: sharedData.selectedChild) { newValue in
                        childrenIndex = (Int(newValue?.suffix(1) ?? "1") ?? 1) - 1
                    }
                    
                    Spacer()
                    
                    ForEach(Array(zip(["D", "S", "T", "Q", "Q", "S", "S"]
                        .indices, ["D", "S", "T", "Q", "Q", "S", "S"])), id: \.0) { index, day in
                        Button(action: {
                            selectedDayIndex = index
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(selectedDayIndex == index ? .purplebalance : .lightpurplebalance)
                                Text(day)
                                    .foregroundStyle(selectedDayIndex == index ? .white : .black)
                                    .font(Font.custom("Nunito-Regular", size: 12))
                            }
                        })
                    }
                }
                .frame(width: 345)
            }
            .zIndex(1)
            
            HStack {
                Picker(selection: $hours[selectedDayIndex], label: Text("Horas")) {
                    ForEach(0..<24) { hour in
                        Text("\(hour)h").tag(hour)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100)
                
                Picker(selection: $minutes[selectedDayIndex], label: Text("Minutos")) {
                    ForEach(0..<60) { minute in
                        Text("\(minute)min").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100)
            }
            .frame(height: 150)
            
            Button(action: {
                let totalMinutes = hours[selectedDayIndex] * 60 + minutes[selectedDayIndex]
                let date = Calendar.current.date(bySettingHour: totalMinutes / 60, minute: totalMinutes % 60, second: 0, of: Date())!
                sharedData.children[childrenIndex].weekDays?[selectedDayIndex].hours = date
            }, label: {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.orangebalance)
                        .frame(width: 80, height: 40)
                        .cornerRadius(6)
                    Text("Definir")
                        .foregroundStyle(.white)
                        .font(Font.custom("Nunito-SemiBold", size: 17)
                            .weight(.semibold))
                }.padding(.leading, 200)
            })
            
            Spacer()
        }
        .environmentObject(sharedData)
    }
}

#Preview {
    SecondView().environmentObject(SharedData())
}

