//
//  DataStore.swift
//  StewardTodoApp
//
//  Created by Erdem Senol on 7.08.2021.
//

import Foundation


class DataStore: ObservableObject{
    
    init(){
        loadToDos()
    }
    
    @Published var toDos: [ToDo] = []
    
    func addTodo(_ toDo: ToDo){
        toDos.append(toDo)
    }
    
    func updateToDo(_ toDo: ToDo){
        guard let index = toDos.firstIndex(where: {$0.id == toDo.id}) else {return}
        toDos[index] = toDo
    }
    
    func deleteToDO(at indexSet: IndexSet){
        toDos.remove(atOffsets: indexSet)
    }
    
    func loadToDos(){
        toDos = ToDo.sampleData
    }
    
    func saveTodDos(){
        print("Saving toDos to file system eventually")
    }
}
