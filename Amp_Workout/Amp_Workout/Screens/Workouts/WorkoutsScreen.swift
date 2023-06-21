//
//  WorkoutsScreen.swift
//  Amp_Workout
//
//  Created by Jonathan Hoch on 21/06/2023.
//

import SwiftUI

struct WorkoutsScreen: View {
    
    @StateObject private var screenModel = WorkoutsScreenModel(workoutProvider: WorkoutsProvider())
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(screenModel.workouts) { workout in
                            WorkoutCell(workout: workout)
                                .padding(.bottom, 8)
                                .onTapGesture {
                                    path.append(workout)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .alert("Failed to load workouts", isPresented: $screenModel.showAlert) {
                    Button("OK") {}
                }
                .navigationDestination(for: Workout.self) { workout in
                    WorkoutDetailsScreen(screenModel: WorkoutDetailsScreenModel(workout: workout))
                }
            }
            .navigationTitle("Workouts")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct WorkoutsScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsScreen()
    }
}
