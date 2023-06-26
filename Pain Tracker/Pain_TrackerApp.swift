//
//  Pain_TrackerApp.swift
//  Pain Tracker
//
//  Created by massi on 24/06/2023.
//

import SwiftUI
import SwiftData

@main
struct Pain_TrackerApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Entry.self], inMemory: false, isAutosaveEnabled: true, isUndoEnabled: false)
    }
}
