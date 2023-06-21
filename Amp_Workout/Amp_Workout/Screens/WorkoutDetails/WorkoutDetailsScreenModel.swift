//
//  WorkoutDetailsScreenModel.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import Foundation

class WorkoutDetailsScreenModel: ObservableObject {
    
    @Published private(set) var workout: Workout
    
    init(workout: Workout) {
        self.workout = workout
    }
}

