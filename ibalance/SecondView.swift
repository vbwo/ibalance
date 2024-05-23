//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI

struct SecondView: View {
    
    @State private var selectedDayIndex: Int = 0
    @Binding var selectedOptions: [[String?]]
    @State private var showAlert = false
    @State private var duplicatedOption: String? = nil
    @Binding var hours: [Int]
    @Binding var minutes: [Int]
    private var allDropdownsSelected: Bool {
        return selectedOptions.allSatisfy { $0.allSatisfy { $0 != nil } }
    }
    
    
    var body: some View {
        VStack {
            
            IntroPage(image: "quase",
                      firsttext: Text("Por fim, **adicione as prioridades de cada \ncategoria de aplicativo.**"),
                      secondtext: Text("Assim, podemos calcular o tempo a ser\ngasto pelo seu filho em cada uma."),
                      command: "Prioridade por categoria de app:",
                      width: 315,
                      padding: 0)
            
            DaysAndHoursView(selectedDayIndex: $selectedDayIndex, hours: $hours, minutes: $minutes)
            
            Divider()
                .frame(width: 345)
                .padding(.top, 16)
            
            HStack {
                VStack {
                    Text("Estudos")
                        .font(Font.custom("Nunito-SemiBold", size: 16))
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
                        .font(Font.custom("Nunito-SemiBold", size: 16))
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
                        .font(Font.custom("Nunito-SemiBold", size: 16))
                        .foregroundStyle(Color.darkbluebalance)
                    DropdownView(selection: $selectedOptions[selectedDayIndex][2],
                                 options: ["Máxima", "Média", "Mínima"],
                                 menuTitle: "Opção",
                                 menuWidth: 110,
                                 selectedOptions: $selectedOptions[selectedDayIndex],
                                 optionIndex: 2
                    )
                }
                
            } .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .frame(width: 345)
                .padding(.top, 10)
            
            if showButton {
                Button(action: {
                    for (i, row) in selectedOptions.enumerated() {
                        for (j, _) in row.enumerated() {
                            if (i == 0) {
                                continue
                            }
                            selectedOptions[i][j] = selectedOptions[0][j]
                        }
                    }
                }, label: {
                    Text("Aperte para aplicar aos outros dias.")
                        .font(Font.custom("Nunito-Medium",
                                          size: 16))
                        .foregroundStyle(Color.darkbluebalance)
                        .underline(true, color: .darkbluebalance)
                        .padding(.top, 6)
                })}
            
            Spacer()
            
        } .background(Color.background.opacity(0.01))
            .highPriorityGesture(DragGesture())
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
    
    private var showButton: Bool {
        return selectedDayIndex == 0 && selectedOptions[0][0] != nil && selectedOptions[0][1] != nil && selectedOptions[0][2] != nil
    }
    
}

struct DaysAndHoursView: View {
    
    @Binding var selectedDayIndex: Int
    @Binding var hours: [Int]
    @Binding var minutes: [Int]
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(Array(zip(["D", "S", "T", "Q", "Q", "S", "S"].indices,
                              ["D", "S", "T", "Q", "Q", "S", "S"])), id: \.0) { index, day in
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
                        .font(Font.custom("Nunito-Regular", size: 12))
                        .foregroundStyle(Color.darkpurplebalance)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .frame(width: 345)
        .padding(.top, 10)
    }
}
