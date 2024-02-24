//
//  GroupingDataInSwiftDataApp.swift
//  GroupingDataInSwiftData
//
//  Created by test on 24.02.2024.
//

import SwiftUI
import SwiftData

@main
struct GroupingDataInSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Movie.self])
        }
    }
}
