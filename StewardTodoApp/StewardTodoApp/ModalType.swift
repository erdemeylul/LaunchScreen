//
//  ModalType.swift
//  StewardTodoApp
//
//  Created by Erdem Senol on 7.08.2021.
//

import SwiftUI

enum ModalType: Identifiable, View{
    case new
    case update(ToDo)
    
    var id: String{
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
 
        }
    }
        
    var body: some View{
        switch self{
        case .new:
            return ToDoFormView(formVm: ToDoFormViewModel())
        case .update(let toDo):
            return ToDoFormView(formVm: ToDoFormViewModel(toDo))
        }
    }
}
