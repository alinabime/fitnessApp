//
//  HomeView.swift
//  fitnessApp
//
//  Created by alinabi on 3/29/25.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Int = 100
    @State var active: Int = 0
    @State var stand: Int = 0
    var body: some View {
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
