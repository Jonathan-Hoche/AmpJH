//
//  WorkoutCell.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import SwiftUI

struct WorkoutCell: View {
    
    let workout: Workout
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Text(workout.name)
                        .font(.title2)
                        .padding()
                    Spacer()
                }
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.orange, lineWidth: 2)
        }
    }
}

//struct WorkoutCell_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutCell(workout: Wo)
//    }
//}
