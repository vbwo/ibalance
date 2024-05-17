//
//  TimePickerView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 17/05/24.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var selectedHoursAmount = 2
    @Published var selectedMinutesAmount = 0

    let hoursRange = 0...23
    let minutesRange = 0...59
}

struct TimePickerView: View {

    let title: String
    let range: ClosedRange<Int>
    let binding: Binding<Int>

    @StateObject private var model = TimerViewModel()
    
    var body: some View {
        HStack() {
            Picker(title, selection: binding) {
                ForEach(model.hoursRange, id: \.self) { timeIncrement in
                    HStack {
                        Spacer()
                        Text("\(timeIncrement)")
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                ForEach(model.minutesRange, id: \.self) { timeIncrement in
                    HStack {
                        Spacer()
                        Text("\(timeIncrement)")
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
            }
            .pickerStyle(InlinePickerStyle())
            .labelsHidden()

            Text(title)
                .fontWeight(.regular)
        }
    }
}
