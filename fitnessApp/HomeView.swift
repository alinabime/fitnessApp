//
//  HomeView.swift
//  fitnessApp
//
//  Created by alinabi on 3/29/25.
//

import SwiftUI

struct HomeView: View {
    let activityCardsMockData: [ActivityCardModel] = [
        ActivityCardModel(title: "Today Steps", subtitle: "Goal: 10,000", image: "figure.walk", tintColor: .green, amount: 6_000),
        ActivityCardModel(title: "Calories Burned", subtitle: "Goal: 500 kcal", image: "flame.fill", tintColor: .red, amount: 350),
        ActivityCardModel(title: "Exercise Minutes", subtitle: "Goal: 30 min", image: "clock.fill", tintColor: .orange, amount: 20),
        ActivityCardModel(title: "Exercise Minutes", subtitle: "Goal: 30 min", image: "clock.fill", tintColor: .orange, amount: 20)
    ]
    let workoutsMockData: [WorkoutCardModel] = [
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

    @State var calories: Int = 100
    @State var active: Int = 0
    @State var stand: Int = 0
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        Spacer()
                        VStack(alignment: .leading) {
                            MetricView(title: "Workout", value: "123 kcal", color: .red)
                            MetricView(title: "Active", value: "10 minutes", color: .green)
                            MetricView(title: "Stand", value: "8 hours", color: .green)
                        }
                        Spacer()
                        
                        ZStack {
                            progressCircleView(progress: $calories, goal: 600, tintColor: .red)
                            progressCircleView(progress: $active, goal: 600, tintColor: .green)
                                .padding(.all, 20)
                            progressCircleView(progress: $stand, goal: 600, tintColor: .blue)
                                .padding(.all, 40)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding( )
                    
                    HStack {
                        Text("Fitness activity")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            print("show more button tapped")
                        } label: {
                            Text("Show more")
                                .padding(.all, 10)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(16)
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible()) , GridItem(.flexible())], spacing: 16) {
                        ForEach(activityCardsMockData) { activity in
                            ActivityCardView(activity: activity)
                            
                        }
                    }
                    
                    HStack {
                        Text("Recent workouts")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text("Show more")
                                .padding(.all, 10)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(16)
                        }
                        
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 4)
                    
                    LazyVStack(spacing: 12) {
                        ForEach(workoutsMockData) { workout in
                            WorkoutCardView(workout: workout)
                        }
                    }
                    .padding(.horizontal)

                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

struct MetricView: View {
    var title: String
    var value: String
    var color: Color
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(color)
            
            Text(value)
                .fontWeight(.bold)
        }
        .padding(.bottom)
    }
}
