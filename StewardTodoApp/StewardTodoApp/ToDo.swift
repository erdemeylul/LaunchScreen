//
//  ToDo.swift
//  StewardTodoApp
//
//  Created by Erdem Senol on 7.08.2021.
//

import Foundation

struct ToDo: Identifiable, Codable{
    var id: String = UUID().uuidString
    
    var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [
            ToDo(name: "Get Groceries"),
            ToDo(name: "Make me happy", completed: true)
        ]
    }
}


