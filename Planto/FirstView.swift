//
//  ContentView.swift
//  Planto
//
//  Created by Danyah ALbarqawi on 16/10/2025.

import SwiftUI

struct FirstView: View {
    
    @State private var showHome = false
    
    var body: some View {
        ZStack {
            
            HStack{
                Text("My Plants🌱")
                    .font(.largeTitle)
                    .padding(.top, -370).bold()
                     Spacer() //دف النص لليسار
                
            }
            .padding()
            
    if showHome {
            
        PlantReminderSheet(isPresented: $showHome)  // Add this parameter with $
        
        .transition(.move(edge: .bottom))
      .animation(.easeInOut(duration: 0.6), value: showHome)
        
            } else {
               
        VStack {
            HStack {
                Image("plant1")
                    .resizable()
                    .frame(width: 315, height: 330)
                
            }.padding()
                    
        Button(action: {withAnimation {showHome = true}
            
                    }) {
                Text("Set plant reminder")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 280, height: 41)
                .background(Color.green)
                .cornerRadius(41 / 2)
                .opacity(0.45)
                .overlay(RoundedRectangle(cornerRadius: 41 / 2)
                .stroke(Color.white, lineWidth: 0.25)
    .shadow(color: Color.white, radius: 2, x: 2, y: 2)
                            )
                    }
                }
                .transition(.move(edge: .top))
                .animation(.easeInOut(duration: 0.6), value: showHome)
            }
        }
    }
}

#Preview {
    FirstView()
}
