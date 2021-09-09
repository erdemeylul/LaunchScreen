//
//  ToDoFormView.swift
//  StewardTodoApp
//
//  Created by Erdem Senol on 7.08.2021.
//

import SwiftUI

struct ToDoFormView: View {
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var formVm: ToDoFormViewModel
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            Form{
                VStack(alignment: .leading){
                    TextField("ToDo", text: $formVm.name)
                    Toggle("Completed", isOn: $formVm.completed)
                }
            }.navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updareSaveButton)
        }
    }
}

extension ToDoFormView{
    func updateToDo(){
        let toDo = ToDo(id: formVm.id!, name: formVm.name, completed: formVm.completed)
        dataStore.updateToDo(toDo)
        mode.wrappedValue.dismiss()
    }
    
    func addToDo(){
        let toDo = (ToDo(name: formVm.name))
        dataStore.addTodo(toDo)
        mode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View{
        Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Text("Cancel")
        })
    }
    
    var updareSaveButton: some View{
        Button(action: {
            if formVm.updating{
                updateToDo()
            }else{
                addToDo()
            }
        }, label: {
            Text(formVm.updating ? "Update" : "Save")
        }).disabled(formVm.isDisabled)
    }
}

struct ToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoFormView(formVm: ToDoFormViewModel())
            .environmentObject(DataStore())
    }
}
