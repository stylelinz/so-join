//
//  so_joinApp.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/6.
//

import SwiftUI

@main
struct so_joinApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 31 / 255, green: 38 / 255, blue: 41 / 255, alpha: 1)
    }
}