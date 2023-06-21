//
//  WorkoutsScreenModel.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import Foundation


class WorkoutsScreenModel: ObservableObject {
    
    @Published private(set) var workouts = [Workout]()
    
    @Published var showAlert = false // Used as Binding in UI

    let workoutProvider: WorkoutsProviderProtocol
    
    init(workoutProvider: WorkoutsProviderProtocol) {
        self.workoutProvider = workoutProvider
        getWorkouts()
    }
    
    private func getWorkouts() {
        switch workoutProvider.getWorkouts() {
        case .success(let workouts):
            self.workouts = workouts
        case .failure(_):
            showAlert = true
        }
    }
}
