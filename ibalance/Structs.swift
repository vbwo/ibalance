//
//  Structs.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 20/05/24.
//

import Foundation

//COLOCAR OPCIONAL ONDE FOR NECESSARIO (quase tudo)
//Primeira tela: criar lista de Child. Tamanho da lista depende da quantidade de childs que o usuário colocou
struct Child {
    var weekDays: [WeekDay]?
}

//tela 2: definir os weekdays de cada criança. Somente hours será preenchido agora, activities será só na proxima tela
struct WeekDay {
    var hours: Date
    var activities: [Activity]
}

//tela3: preencher a activity de cada weekday de cada criança.
struct Activity {
    var nome: String
    var priority: Int
}


// C[1]
// C[2]

//C[1].weekDays[S,T,Q,Q,S,S] // selecionei quarta, seria o dia "3"
//C[1].weekDays[0].hours
//C[1].weekDays[0].activies[]

