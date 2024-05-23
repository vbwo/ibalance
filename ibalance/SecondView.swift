//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct SecondView: View {
    
    @State private var selectedDayIndex: Int = 0
    @State private var selectedOptions: [[String?]] = Array(repeating: [nil, nil, nil], count: 7)
    @State private var showAlert = false
    @State private var duplicatedOption: String? = nil
    @Binding var hours: [Int]
    @Binding var minutes: [Int]
    
    var body: some View {
        VStack {
            VStack {
                IntroPage(image: "perfeito",
                          firsttext: Text("Por fim, **adicione as prioridades de cada \ncategoria de aplicativo.**"),
                          secondtext: Text("Assim, podemos calcular o tempo a ser\ngasto pelo seu filho em cada uma."),
                          command: "Prioridade por categoria de app:",
                          width: 315,
                          padding: 0)
                    .padding(.top, -5)
            } .zIndex(2)
            .frame(width: 345)
            .padding(.bottom, 20)
            
            DaysAndHoursView(selectedDayIndex: $selectedDayIndex, hours: $hours, minutes: $minutes)
            
            Divider()
                .frame(width: 345)
                .padding(.top, 16)
            
            HStack {
                VStack {
                    Text("Estudos")
                        .font(Font.custom("Nunito-Medium", size: 16))
                        .foregroundStyle(Color.darkbluebalance)
                    DropdownView(selection: $selectedOptions[selectedDayIndex][0],
                                 options: ["Máxima", "Média", "Mínima"],
                                 menuTitle: "Opção",
                                 menuWidth: 110,
                                 selectedOptions: $selectedOptions[selectedDayIndex],
                                 optionIndex: 0
                    )
                }
                
                Spacer()
                
                VStack {
                    Text("Jogos")
                        .font(Font.custom("Nunito-Medium", size: 16))
                        .foregroundStyle(Color.darkbluebalance)
                    DropdownView(selection: $selectedOptions[selectedDayIndex][1],
                                 options: ["Máxima", "Média", "Mínima"],
                                 menuTitle: "Opção",
                                 menuWidth: 110,
                                 selectedOptions: $selectedOptions[selectedDayIndex],
                                 optionIndex: 1
                    )
                }
                
                Spacer()
                
                VStack {
                    Text("Redes")
                        .font(Font.custom("Nunito-Medium", size: 16))
                        .foregroundStyle(Color.darkbluebalance)
                    DropdownView(selection: $selectedOptions[selectedDayIndex][2],
                                 options: ["Máxima", "Média", "Mínima"],
                                 menuTitle: "Opção",
                                 menuWidth: 110,
                                 selectedOptions: $selectedOptions[selectedDayIndex],
                                 optionIndex: 2
                    )
                }
            }
            .frame(width: 345)
            .padding(.top, 10)
            
            Spacer()
        }
        .onChange(of: selectedOptions) { 
            checkForDuplicates()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Atenção"),
                message: Text("A prioridade não pode ser repetida."),
                dismissButton: .default(Text("OK")) {
                    if let duplicatedOption = duplicatedOption {
                        if let lastIndex = selectedOptions[selectedDayIndex].lastIndex(of: duplicatedOption) {
                            selectedOptions[selectedDayIndex][lastIndex] = nil
                        }
                    }
                    duplicatedOption = nil
                }
            )
        }
    }
    
    private func checkForDuplicates() {
        var foundDuplicates = false
        var duplicateOption: String?
        
        for option in selectedOptions[selectedDayIndex] {
            guard let option = option else { continue }
            
            if selectedOptions[selectedDayIndex].filter({ $0 == option }).count > 1 {
                foundDuplicates = true
                duplicateOption = option
                break
            }
        }
        
        showAlert = foundDuplicates
        duplicatedOption = duplicateOption
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(hours: .constant([0, 1, 2, 3, 4, 5, 6]), minutes: .constant([0, 10, 20, 30, 40, 50, 60]))
    }
}

struct DaysAndHoursView: View {
    
    @Binding var selectedDayIndex: Int
    @Binding var hours: [Int]
    @Binding var minutes: [Int]
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(Array(zip(["D", "S", "T", "Q", "Q", "S", "S"].indices, ["D", "S", "T", "Q", "Q", "S", "S"])), id: \.0) { index, day in
                VStack {
                    Button(action: {
                        selectedDayIndex = index
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(selectedDayIndex == index ? .purplebalance : .lightpurplebalance)
                            Text(day)
                                .foregroundStyle(selectedDayIndex == index ? .white : .black)
                                .font(Font.custom("Nunito-Regular", size: 14))
                        }
                    }
                    Text("\(hours[index])h\n\(minutes[index])min")
                        .font(Font.custom("Nunito-Regular", size: 9))
                        .foregroundStyle(Color.darkpurplebalance)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .frame(width: 345)
        .padding(.top, 10)
    }
}
