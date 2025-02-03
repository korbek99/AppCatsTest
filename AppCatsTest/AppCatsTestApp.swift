//
//  AppCatsTestApp.swift
//  AppCatsTest
//
//  Created by Jose Preatorian on 03-02-25.
//

import SwiftUI

@main
struct AppCatsTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
