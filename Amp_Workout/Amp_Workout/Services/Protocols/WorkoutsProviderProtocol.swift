//
//  WorkoutsProviderProtocol.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import Foundation

protocol WorkoutsProviderProtocol {
    func getWorkouts() -> Result<[Workout], Error>
}
