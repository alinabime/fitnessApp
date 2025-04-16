//
//  HomeViewMOdel.swift
//  fitnessApp
//
//  Created by alinabi on 4/1/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var activityCardsMockData: [ActivityCardModel] = [
        ActivityCardModel(title: "Today Steps", subtitle: "Goal: 10,000", image: "figure.walk", tintColor: .green, amount: 6_000),
        ActivityCardModel(title: "Calories Burned", subtitle: "Goal: 500 kcal", image: "flame.fill", tintColor: .red, amount: 350),
        ActivityCardModel(title: "Exercise Minutes", subtitle: "Goal: 30 min", image: "clock.fill", tintColor: .orange, amount: 20),
        ActivityCardModel(title: "Exercise Minutes", subtitle: "Goal: 30 min", image: "clock.fill", tintColor: .orange, amount: 20)
    ]
    @Published var workoutsMockData: [WorkoutCardModel] = [
        WorkoutCardModel(
            name: "Morning Run",
            image: "figure.run",
            duration: 30,
            calories: 280,
            date: Date(),
            tintColor: .green
        ),
        WorkoutCardModel(
            name: "Cycling",
            image: "bicycle",
            duration: 45,
            calories: 410,
            date: Date(),
            tintColor: .blue
        ),
        WorkoutCardModel(
            name: "HIIT Session",
            image: "flame.fill",
            duration: 20,
            calories: 350,
            date: Date(),
            tintColor: .red
        )
    ]

}
