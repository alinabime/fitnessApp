//
//  ActivityCardView.swift
//  fitnessApp
//
//  Created by alinabi on 4/1/25.
//

import SwiftUI


struct ActivityCardView: View {
    let activity: ActivityCardModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(uiColor: .systemGray6))
                .shadow(radius: 4)

            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading,spacing: 8) {
                        Text(activity.title)
                            .font(.headline)
                        
                        Text(activity.subtitle)
                            .font(.caption)
                            .foregroundColor(Color.secondary)
                    }
                    Spacer()
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tintColor)
                }
                Text(activity.amount.description)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }
            .padding()

        }
    }
}

#Preview {
    ActivityCardView(activity: ActivityCardModel(title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: Color.green, amount: 6000))
}
