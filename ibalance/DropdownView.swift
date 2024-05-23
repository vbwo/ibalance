//
//  DropdownView.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 16/05/24.
//

import SwiftUI
import Combine

enum DropDownPickerState {
    case top
    case bottom
}

struct DropdownView: View {
    
    @Binding var selection: String?
    @State var showDropdown = false
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var state: DropDownPickerState = .bottom
    var options: [String]
    var maxWidth: CGFloat = 180
    var menuTitle: String
    var menuWidth: CGFloat
    
    @Binding var selectedOptions: [String?]
    var optionIndex: Int
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                HStack {
                    Text(selection == nil ? menuTitle : selection!)
                        .foregroundColor(selection != nil ? Color.darkbluebalance : Color.darkbluebalance)
                        .font(Font.custom("Nunito-Regular", size: 16))
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(Color.darkbluebalance)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: menuWidth, height: 40)
                .background(.white)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if state == .bottom && showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(.white)
            .cornerRadius(6)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.darkbluebalance)
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
            .zIndex(zindex)
        }
        .frame(width: menuWidth, height: 40)
    }
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                        .font(Font.custom("Nunito-Regular", size: 16))
                    Spacer()
                }
                .foregroundStyle(selection == option ? Color.darkbluebalance : Color.darkbluebalance)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        selectedOptions[optionIndex] = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}
