//
//  SecondView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 09/05/24.
//

import SwiftUI


struct SecondView: View {
    
    @State var date: Date = .now
    @EnvironmentObject var sharedData: SharedData
    
    
    var body: some View {
        VStack {
            IntroPage(
                image: "perfeito",
                firsttext: Text("Agora, **defina o tempo que você quer que \nseus filhos passem no celular diariamente.**"),
                secondtext: Text("Você pode definir tempos diferentes para \ncada dia da semana também."),
                command: "Tempo no celular por dia:",
                width: 315,
                padding: 0
            )
            
            DropdownView(
                selection: $sharedData.selectedChild,
                options: sharedData.childOptions,
                menuTitle: "Filho 01",
                menuWidth: 120
            )  .padding(.trailing, 220)
            
            DatePicker(
                "",
                selection: $date,
                displayedComponents: .hourAndMinute
                    
            ) .padding(.trailing, 40)
                .datePickerStyle(.wheel)
            
            Spacer()
            
        }
    }
}

#Preview {
    SecondView().environmentObject(SharedData())
}
