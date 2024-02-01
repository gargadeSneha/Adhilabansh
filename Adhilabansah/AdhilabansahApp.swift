//
//  AdhilabansahApp.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 12/07/23.
//

import SwiftUI

@main
struct AdhilabansahApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LunchScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
