//
//  PageStatusView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 16/05/24.
//

import SwiftUI

struct PageStatus: View {
    
    @Binding var current: Int
    @Binding var colors: [Color]
    
    var body: some View {
        
        HStack {
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[0])
                .animation(.easeInOut, value: current)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[1])
                .animation(.easeInOut, value: current)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[2])
                .animation(.easeInOut, value: current)
        }
        
    }
}
