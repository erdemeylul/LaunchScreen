//
//  StewardTodoAppApp.swift
//  StewardTodoApp
//
//  Created by Erdem Senol on 7.08.2021.
//

import SwiftUI

@main
struct StewardTodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
