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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
