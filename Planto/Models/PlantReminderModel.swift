//
//  PlantReminderModel.swift
//  Planto
//
//  Created by Danyah ALbarqawi on 24/10/2025.
//

import Foundation

// MARK: - Plant Reminder Model
struct PlantReminder: Identifiable, Codable {
    let id: UUID
    var plantName: String
    var room: String
    var lightCondition: String
    var waterAmount: String
    var isChecked: Bool
    
    init(id: UUID = UUID(), plantName: String, room: String, lightCondition: String, waterAmount: String, isChecked: Bool = false) {
        self.id = id
        self.plantName = plantName
        self.room = room
        self.lightCondition = lightCondition
        self.waterAmount = waterAmount
        self.isChecked = isChecked
    }
}
