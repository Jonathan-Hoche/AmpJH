//
//  WorkoutsProvider.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import Foundation
import CodableCSV

struct WorkoutsProvider: WorkoutsProviderProtocol {
    
    func getWorkouts() -> Result<[Workout], Error> {
        let localURL = LocalFileURL()
        guard let url = localURL(named: "workouts", fileExtension: "csv") else {
            return .failure(WorkoutsProviderError.fileNotFound)
        }
        
        let decoder = CSVDecoder()
        
        do {
            let workouts = try decoder.decode([Workout].self, from: url)
            return .success(workouts)
        } catch {
            return .failure(WorkoutsProviderError.parsingFailed)
        }
    }
}

enum WorkoutsProviderError: Error {
    case fileNotFound
    case parsingFailed
}


fileprivate final class LocalFileURL {
    
    func callAsFunction(named fileName: String, fileExtension: String, inBundle: Bundle? = nil) -> URL? {
        let bundle = inBundle ?? Bundle(for: Self.self)
        return bundle.url(forResource: fileName, withExtension: fileExtension)
    }
}

