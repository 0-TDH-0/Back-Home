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
    
    @State var screen = "main"
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if screen == "main"{
                MainScreen(screen: $screen)
            }
            else if screen == "settings"{
                Settings(screen: $screen)
            }
            else if screen == "inbox"{
                Inbox(screen: $screen)
            }
            else if screen == "found"{
                Found(screen: $screen)
            }
            else if screen == "lost"{
                Lost(screen: $screen)
            }
            else if screen == "list"{
                LostList(screen: $screen)
            }
            
        }
        .modelContainer(sharedModelContainer)
    }
}
