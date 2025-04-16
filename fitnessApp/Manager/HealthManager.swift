//
//  HealthManager.swift
//  fitnessApp
//
//  Created by alinabi on 4/6/25.
//

import Foundation
import HealthKit

class HealthManager {
    
    let healthStore = HKHealthStore()
    
    static let shared = HealthManager()
    
    private init() {}
    
    func requestAuthorization(compeletion: @escaping(Bool) -> ()) {
        guard HKHealthStore.isHealthDataAvailable() else {
            compeletion(false)
            return

        }
    
        let typesToRead: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        
        healthStore.requestAuthorization(toShare: [], read: typesToRead) { success, error in
            compeletion(success)
        }
    }
    
    func getToDayStepCount(compeletion: @escaping(Double) ->()) {
        guard let stepType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            compeletion(0)
            return
        }
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now)
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, Result, _ in
            guard let sum = Result?.sumQuantity() else {
                compeletion(0)
                return
            }
            let stepCount = sum.doubleValue(for: HKUnit.count())
            compeletion(stepCount)
        }
        healthStore.execute(query)
    }
}
