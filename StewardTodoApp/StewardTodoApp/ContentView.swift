//
//  ContentView.swift
//  StewardTodoApp
//
//  Created by Erdem Senol on 7.08.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    @State var modalType: ModalType? = nil
    
    var body: some View {
        NavigationView{
            List(){
                ForEach(dataStore.toDos){toDo in
                    Button(action: {
                        modalType = .update(toDo)
                    }, label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    })
                }.onDelete(perform: dataStore.deleteToDO)
            }.listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My toDos")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        modalType = .new
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            }
        }.sheet(item: $modalType) {$0}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
