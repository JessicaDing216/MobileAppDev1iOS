//
//  Mobile_dev_1_final_projectApp.swift
//  Mobile_dev_1_final_project
//
//  Created by Chou-Ping Ding on 28.4.2023.
//

import SwiftUI

@main
struct Mobile_dev_1_final_projectApp: App {
    
    @StateObject private var manager = CountryManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
