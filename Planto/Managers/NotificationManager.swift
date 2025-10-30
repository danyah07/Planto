//
//  NotificationManager.swift
//  Planto
//
//  Created by Danyah ALbarqawi on 27/10/2025.
//
// MARK: - Schedule Repeating Reminder Every 10 Minutes
// For TESTING purposes - reminds user every 10 minutes
import Foundation
import UserNotifications
import SwiftUI

// MARK: - Notification Manager
class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    
    // MARK: - Request Permission
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("✅ Notification permission granted")
            } else if let error = error {
                print("❌ Notification permission error: \(error.localizedDescription)")
            } else {
                print("⚠️ Notification permission denied")
            }
        }
    }
    
    // MARK: - Schedule Every 10 Minutes
    func scheduleRepeatingReminder() {
        // Cancel any existing notifications first
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default
        content.badge = 1
        
        // Repeats every 10 minutes (600 seconds)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 600, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: "tenMinuteReminder",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("✅ 10-minute reminder scheduled")
            }
        }
    }
    
    // MARK: - Schedule Daily Reminder
    func scheduleDailyReminder(at hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: "dailyPlantReminder",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("✅ Daily reminder scheduled for \(hour):\(String(format: "%02d", minute))")
            }
        }
    }
    
    // MARK: - Schedule Reminder for Specific Plant
    func scheduleReminderForPlant(_ plant: PlantReminder, at hour: Int = 9, minute: Int = 0) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Time to water \(plant.plantName) 💧"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create unique identifier for this plant
        let identifier = "plant_\(plant.id.uuidString)"
        
        let request = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Error scheduling plant notification: \(error.localizedDescription)")
            } else {
                print("✅ Reminder scheduled for \(plant.plantName)")
            }
        }
    }
    
    // MARK: - Cancel Notification for Plant
    func cancelNotificationForPlant(_ plant: PlantReminder) {
        let identifier = "plant_\(plant.id.uuidString)"
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        print("🗑️ Cancelled notification for \(plant.plantName)")
    }
    
    // MARK: - Cancel All Notifications
    func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("🗑️ All notifications cancelled")
    }
    
    // MARK: - Reset Badge Count
    func resetBadgeCount() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
    
    // MARK: - Check Pending Notifications (Debug)
    func checkPendingNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            print("📋 Pending notifications: \(requests.count)")
            for request in requests {
                print("  - \(request.identifier)")
            }
        }
    }
}
