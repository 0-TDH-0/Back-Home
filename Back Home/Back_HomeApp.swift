//
//  Back_HomeApp.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import SwiftUI
import SwiftData

@main
struct Back_HomeApp: App {
    
    @State var isLoggedIn: Bool = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainScreen()
            }
            else {
                MainLoginScreen(isLoggedIn: $isLoggedIn)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
