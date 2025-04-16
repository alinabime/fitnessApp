//
//  progressCircleView.swift
//  fitnessApp
//
//  Created by alinabi on 3/29/25.
//

import SwiftUI

struct progressCircleView: View {
    @Binding var progress: Int
    var goal: Int
    var tintColor: Color
    var lineWidth: CGFloat = 20
    var body: some View {
        ZStack {
            Circle()
                .stroke(tintColor.opacity(0.3),lineWidth: lineWidth)
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal) )
                .stroke(tintColor,style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(Angle(degrees: 270))
                .shadow(radius: 5)
                
        }
        .padding()
    }
}

#Preview {
    progressCircleView(progress: .constant(100), goal: 300, tintColor: .red)
}
