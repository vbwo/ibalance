//
//  FirstView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 16/05/24.
//

import SwiftUI

struct FirstView: View {
    
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        NavigationStack {
            VStack {
                IntroPage(
                    image: "ola",
                    firsttext: Text("Promova um uso **equilibrado de telas** \naos seus filhos."),
                    secondtext: Text("Para isso, **comece respondendo a \nseguinte questão:**"),
                    command: "Quantos filhos você tem?",
                    width: 275,
                    padding: 35
                )
                .zIndex(4)
                
                DropdownView(
                    selection: $sharedData.selectedNumberOfChildren,
                    options: ["01", "02", "03", "04", "05"],
                    menuTitle: "Filhos",
                    menuWidth: 105
                )
                .padding(.trailing, 236)
                .onChange(of: sharedData.selectedNumberOfChildren) { _ in
                    sharedData.updateChildOptions()
                    let amount = Int(sharedData.selectedNumberOfChildren ?? "0") ?? 0
                    sharedData.createNewElement(amount: amount)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    FirstView().environmentObject(SharedData())
}
