//
//  ReminderView.swift
//  Planto
//
//  Created by Danyah ALbarqawi on 21/10/2025.
//

import SwiftUI

// Plant Reminder View
struct PlantReminderSheet: View {
    
    @Binding var isPresented: Bool
    
    // MARK: Variables
    
    @State private var plantName: String = "Pothos"
    @State private var selectedRoom: String = "Bedroom"
    @State private var selectedLight: String = "Full sun"
    @State private var wateringFrequency: String = "Every day"
    @State private var waterAmount: String = "20-50 ml"
    
    // MARK: - Data Arrays
    let rooms = ["Living Room", "Bedroom", "Kitchen", "Bathroom", "Balcony"]
    let lightOptions = ["Full sun", "Partial sun", "Low light"]
    let wateringOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days","Every 2 weeks"]
    let waterAmounts = [ "20-50 ml", "50-100 ml", "100-200 ml",]
    
    var body: some View {
        ZStack {
            // MARK: - Dimmed Background
            
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    
                    withAnimation {
                        isPresented = false
                    }
                }
            
            VStack(spacing: 0) {
                
                Spacer()
                
                // MARK: - Sheet Container
                VStack(spacing: 0) {
                    // MARK: - Header Bar
                    
                    HStack {
                        // Close button (X)
                        
                        Button(action: {
                            withAnimation {
                                isPresented = false // Slides sheet down
                            }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(width: 44, height: 44)
                                .background(Color(white: 0.2))
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        // Title in the center
                        Text("Set Reminder")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        // Save button (✓)
                        Button(action: {
                            saveReminder()
                        }) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                                .frame(width:44, height: 44)
                                .background(Color.green)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 50) // Increase this number to push header content down more
                    .padding(.bottom, 16)
                    .background(Color(white: 0.1))
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            // MARK: - Plant Name Text Field
                            // Editable text input for the plant's name
                            HStack {
                                Text("Plant Name")
                                    .foregroundColor(.white)
                                Text("|")
                                    .foregroundColor(.gray)
                                // TextField is bound to plantName state
                                TextField("", text: $plantName)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(white: 0.15))
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .padding(.top, 40) // Increased from 20 to 40
                            
                            // MARK: - Room and Light Section
                           
                            VStack(spacing: 0) {
                                
                                
                                Menu {
                                    // Loop through all room options
                                    ForEach(rooms, id: \.self) { room in
                                        Button(action: {
                                            // Update selected room when tapped
                                            selectedRoom = room
                                        }) {
                                            HStack {
                                                Text(room)
                                                // Show checkmark next to selected option
                                                if selectedRoom == room {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    // Menu button appearance
                                    HStack {
                                        Image(systemName: "location.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16))
                                        Text("Room")
                                            .foregroundColor(.white)
                                        Spacer()
                                        // Display currently selected room
                                        Text(selectedRoom)
                                            .foregroundColor(.gray)
                                        // Up/down chevrons indicate dropdown
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 10, weight: .bold))
                                    }
                                    .padding()
                                    .background(Color(white: 0.15))
                                    .contentShape(Rectangle())
                                }
                                
                                // Divider line between items
                                Divider()
                                    .background(Color(white: 0.25))
                                    .padding(.leading, 52) // Indent to align after icon
                                
                                // MARK: - Light Picker Menu
                                // Same structure as Room picker
                                Menu {
                                    ForEach(lightOptions, id: \.self) { light in
                                        Button(action: {
                                            selectedLight = light
                                        }) {
                                            HStack {
                                                Text(light)
                                                if selectedLight == light {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Image(systemName: "sun.max.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16))
                                        Text("Light")
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text(selectedLight)
                                            .foregroundColor(.gray)
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 10, weight: .bold))
                                    }
                                    .padding()
                                    .background(Color(white: 0.15))
                                    .contentShape(Rectangle())
                                }
                            }
                            .cornerRadius(12)
                            .padding(.horizontal)
                            
                            // MARK: - Watering Section
                            
                            VStack(spacing: 0) {
                                
                                Menu {
                                    ForEach(wateringOptions, id: \.self) { option in
                                        Button(action: {
                                            wateringFrequency = option
                                        }) {
                                            HStack {
                                                Text(option)
                                                if wateringFrequency == option {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Image(systemName: "drop.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16))
                                        Text("Watering Days")
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text(wateringFrequency)
                                            .foregroundColor(.gray)
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 10, weight: .bold))
                                    }
                                    .padding()
                                    .background(Color(white: 0.15))
                                    .contentShape(Rectangle())
                                }
                                
                                Divider()
                                    .background(Color(white: 0.25))
                                    .padding(.leading, 52)
                                
                                // MARK: - Water Amount Picker Menu
                                Menu {
                                    ForEach(waterAmounts, id: \.self) { amount in
                                        Button(action: {
                                            waterAmount = amount
                                        }) {
                                            HStack {
                                                Text(amount)
                                                if waterAmount == amount {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Image(systemName: "drop.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16))
                                        Text("Water")
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text(waterAmount)
                                            .foregroundColor(.gray)
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 10, weight: .bold))
                                    }
                                    .padding()
                                    .background(Color(white: 0.15))
                                    .contentShape(Rectangle())
                                }
                            }
                            .cornerRadius(12)
                            .padding(.horizontal)
                            
                            // Bottom spacing
                            Spacer(minLength: 40)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color(white: 0.1))
                // Round only the top corners to create sheet appearance
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Save Function
    
    func saveReminder() {
        
        print("Saving reminder for \(plantName)")
        print("Room: \(selectedRoom)")
        print("Light: \(selectedLight)")
        print("Watering: \(wateringFrequency)")
        print("Water amount: \(waterAmount)")
        
        
        withAnimation {
            isPresented = false
        }
    }
}

// MARK: - Helper Extension
// Extension to enable rounding specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - Custom Shape
// Shape that allows specifying which corners to round
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct PlantReminderSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            // Purple background to simulate app behind sheet
            Color.purple
            PlantReminderSheet(isPresented: .constant(true))
        }
    }
}
