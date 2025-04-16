//
//  WorkoutCardView.swift
//  fitnessApp
//
//  Created by alinabi on 4/1/25.
//

import SwiftUI


struct WorkoutCardView: View {
    let workout: WorkoutCardModel
    var body: some View {
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(workout.tintColor)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            VStack(spacing: 16) {
                HStack {
                    Text(workout.name)
                        .font(.title3 )
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("\(workout.duration) min")
                        .font(.caption)

                }
            
            HStack {
                Text(formatDate(workout.date))
                    .font(.subheadline)
                
                Spacer()
                
                Text("\(workout.calories) Kcal")
                    .font(.subheadline)
            }
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    WorkoutCardView(workout: WorkoutCardModel(
        name: "Morning Run",
        image: "figure.run",
        duration: 30,
        calories: 280,
        date: Date(),
        tintColor: .green
    ))
}
