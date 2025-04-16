//
//  WorkoutCardModel.swift
//  fitnessApp
//
//  Created by alinabi on 4/1/25.
//

import Foundation
import SwiftUI

struct WorkoutCardModel: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let duration: Int
    let calories: Int
    let date: Date
    let tintColor: Color
}
