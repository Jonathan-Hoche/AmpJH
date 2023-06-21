//
//  Workout.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import Foundation

struct Workout: Codable, Identifiable, Hashable {
    
    let id: String
    var createdAt: Date? = nil
    let description: String
    let difficulty: Difficulty
    let name: String
    let time: Time
    let type: Type
    
    enum Difficulty: String, Codable {
        case beginner = "BEGINNER"
        case intermediate = "INTERMEDIATE"
        case advanced = "ADVANCED"
        
        var string: String {
            switch self {
            case .beginner:
                return "Beginner"
            case .intermediate:
                return "Intermediate"
            case .advanced:
                return "Advanced"
            }
        }
    }
    
    enum Time: String, Codable {
        case five = "FIVE"
        case ten = "TEN"
        case fifteen = "FIFTEEN"
        case twenty = "TWENTY"
        case thirty = "THIRTY"
        case fortyFive = "FORTY_FIVE"
        case sixty = "SIXTY"
        
        var string: String {
            switch self {
            case .five:
                return "Five"
            case .ten:
                return "Ten"
            case .fifteen:
                return "Fifteen"
            case .twenty:
                return "Twenty"
            case .thirty:
                return "Thirty"
            case .fortyFive:
                return "Forty Five"
            case .sixty:
                return "Sixty"
            }
        }
        
        var timeInSeconds: Int {
            switch self {
            case .five:
                return 5 * 60
            case .ten:
                return 10 * 60
            case .fifteen:
                return 15 * 60
            case .twenty:
                return 20 * 60
            case .thirty:
                return 30 * 60
            case .fortyFive:
                return 45 * 60
            case .sixty:
                return 60 * 60
            }
        }
    }
    
    enum `Type`: String, Codable {
        case pureStrength = "PURE_STRENGTH"
        case circuitStrength = "CIRCUIT_STRENGTH"
        case muscleEndurance = "MUSCLE_ENDURANCE"
        case highVolumeTraining = "HIGH_VOLUME_TRAINING"
        case mobility = "MOBILITY"
        case balance = "BALANCE"
        
        var string: String {
            switch self {
                
            case .pureStrength:
                return "Pure Strength"
            case .circuitStrength:
                return "Circuit Strength"
            case .muscleEndurance:
                return "Muscle Endurance"
            case .highVolumeTraining:
                return "High Volume Training"
            case .mobility:
                return "Mobility"
            case .balance:
                return "Balance"
            }
        }
    }
    
    private enum CodingKeys: Int, CodingKey {
        case id = 0
        case createdAt
        case description
        case difficulty
        case name
        case time
        case type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        //self.description = try container.decode(String.self, forKey: .description)
        self.name = try container.decode(String.self, forKey: .name)
        
        if let description = try? container.decode(String.self, forKey: .description) {
            self.description = description == "null" ? "" : description
        } else {
            self.description = ""
        }
        
        if let timestamp = try? container.decode(String.self, forKey: .createdAt) {
            self.createdAt = timestamp.toDate()
        }
        
        if let difficultyString = try? container.decode(String.self, forKey: .difficulty),
           let difficulty = Difficulty(rawValue: difficultyString)  {
            self.difficulty = difficulty
        } else {
            self.difficulty = .beginner
        }
        
        if let timeString = try? container.decode(String.self, forKey: .time),
           let time = Time(rawValue: timeString)  {
            self.time = time
        } else {
            self.time = .five
        }
        
        if let typeString = try? container.decode(String.self, forKey: .type),
           let type = Type(rawValue: typeString)  {
            self.type = type
        } else {
            self.type = .pureStrength
        }
    }
}

private extension String {
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: self) //        2023-05-26T21:17:37.243Z
        
        return date
    }
}

extension Date {
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        return dateFormatter.string(from: self)
    }
}
