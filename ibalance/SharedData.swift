//
//  SharedData.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 21/05/24.
//

import Foundation
import Combine

class SharedData: ObservableObject {
    
    @Published var selectedNumberOfChildren: String? = nil
    @Published var childOptions: [String] = []
    @Published var selectedChild: String? = nil
    @Published var children: [Child] = []
    
    func createNewElement(amount: Int) {
        if amount == 0 { return }
        
        children = []
        
        for _ in 1...amount {
            let newElement = Child()
            self.children.append(newElement)
        }
        print("número de filhos: \(children.count)")
    }
    
    func updateChildOptions() {
        guard let selectedNumber = Int(selectedNumberOfChildren ?? "") else {
            childOptions = []
            return
        }
        childOptions = (1...selectedNumber).map { "Filho 0\($0)" }
        if let firstChild = childOptions.first {
            selectedChild = firstChild
        }
    }
}
