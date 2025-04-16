//
//  ActivityCardModel.swift
//  fitnessApp
//
//  Created by alinabi on 4/1/25.
//

import Foundation
import SwiftUI

struct ActivityCardModel: Identifiable {
    var id: UUID = UUID()
    var title: String
    var subtitle: String
    var image: String
    var tintColor: Color
    var   amount: Int
    
}

