//
//  PlantoApp.swift
//  Planto
//
//  Created by Danyah ALbarqawi on 16/10/2025.
//

import SwiftUI

@main
struct PlantoApp: App {
    init() {
        // Request notification permission when app launches
        NotificationManager.shared.requestAuthorization()
    }
    
    var body: some Scene {
        WindowGroup {
            FirstView()
                .onAppear {
                    // Schedule notification every 10 minutes
                    NotificationManager.shared.scheduleRepeatingReminder()
                }
        }
    }
}
