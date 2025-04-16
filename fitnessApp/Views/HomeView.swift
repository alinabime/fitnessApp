//
//  HomeView.swift
//  fitnessApp
//
//  Created by alinabi on 3/29/25.
//

import SwiftUI


struct HomeView: View {
    // MARK: - ViewModel
    @StateObject private var viewModel = HomeViewModel()

    // MARK: - Progress Variables
    @State private var calories: Int = 100
    @State private var active: Int = 0
    @State private var stand: Int = 0

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    welcomeSection
                    ringsAndMetricsSection
                    sectionHeader(title: "Fitness activity") {
                        print("Show more activities")
                    }
                    activityCardsGrid
                    sectionHeader(title: "Recent workouts") {
                        print("Show more workouts")
                    }
                    workoutsList
                }
                .padding(.vertical)
            }
        }
    }

    // MARK: - Sections

    private var welcomeSection: some View {
        Text("Welcome")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
    }

    private var ringsAndMetricsSection: some View {
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
                    .padding(20)
                progressCircleView(progress: $stand, goal: 600, tintColor: .blue)
                    .padding(40)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.horizontal)
    }

    private var activityCardsGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.activityCardsMockData) { activity in
                ActivityCardView(activity: activity)
            }
        }
        .padding(.horizontal)
    }

    private var workoutsList: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.workoutsMockData) { workout in
                WorkoutCardView(workout: workout)
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Section Header Builder
    @ViewBuilder
    private func sectionHeader(
        title: String,
        buttonAction: @escaping () -> Void
    ) -> some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            Spacer()

            Button(action: buttonAction) {
                Text("Show more")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }

}

// MARK: - Preview

#Preview {
    HomeView()
}

// MARK: - MetricView

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
