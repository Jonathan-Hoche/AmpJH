//
//  WorkoutDetailsScreen.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import SwiftUI

struct WorkoutDetailsScreen: View {
    
    @StateObject var screenModel: WorkoutDetailsScreenModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text(screenModel.workout.name)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text(screenModel.workout.description)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            if let date = screenModel.workout.createdAt?.toString() {
                HStack {
                    Text("Created:")
                    Text(date)
                    Spacer()
                }
            }
           
            HStack {
                Text("Difficulty:")
                Text(screenModel.workout.difficulty.string)
                Spacer()
            }
            
            HStack {
                Text("Type:")
                Text(screenModel.workout.type.string)
                Spacer()
            }
            HStack {
                Text("Time:")
                Text(screenModel.workout.time.string)
                Spacer()
            }
            Spacer()
            
            VStack {
                Button {
                    
                } label: {
                    Text("START WORKOUT")
                }
                .padding(.bottom, 32)
            }
        }
        .padding(.horizontal, 16)
    }
}

//struct WorkoutDetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutDetailsScreen()
//    }
//}
