//
//  ContentView.swift
//  Quit-Social
//
//  Created by Tony Jiang on 3/30/23.
//

import FamilyControls
import SwiftUI

struct ContentView: View {
    @State private var isAppGroupViewActive: Bool = false
    @State private var isSpecificAppGroupViewActive = false
    @ObservedObject var dashboardViewModel = DashboardViewModel()
    @State private var progress: Float = 0.5

    init() {
        // log out user defaults
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hello Tony 👋").font(.title)
                    }
                    Spacer()
                }
                HStack {
                    VStack {
                        Text("Here are your usage stats today").font(.title2)
                        ProgressView(value: progress)
                    }
                }
                
                LazyVStack {
                    ForEach(dashboardViewModel.groupDataList) { group in
                        AppGroupCard(appGroup: group).onTapGesture {
                            self.dashboardViewModel.currentlySelectedAppGroup = group
                            self.isSpecificAppGroupViewActive = true
                        }
                    }
                }
                if dashboardViewModel.groupDataList.count > 0 {
                    Text("Tap to edit restriction")
                } else {
                    Button(action: {
                        isAppGroupViewActive = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                    }
                }
                
                Spacer()
            }.padding()
                .navigationDestination(isPresented: $isAppGroupViewActive) {
                    AppGroupView(appGroupViewModel: AppGroupViewModel())
                }.navigationDestination(isPresented: $isSpecificAppGroupViewActive) {
                    AppGroupView(appGroupViewModel: AppGroupViewModel(group: dashboardViewModel.currentlySelectedAppGroup))
                }
        }
//        NavigationStack {
//            NavigationLink(destination: AppGroupView()) {
//                Text("Go to App Selection")
//            }
//        }
    }
}

struct CardView: View {
    let title: String

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue)
            .frame(height: 150)
            .overlay(
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
            )
    }
}

struct AppGroupCard: View {
    var appGroup: AppGroup
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Group Name: \(appGroup.groupName)")
                .font(.headline)
            
            Text("Time Limit: \(appGroup.timeLimitSelection) minutes")
            
            Text("Start Time: \(formatTime(appGroup.startTimeSelection))")
            
            Text("End Time: \(formatTime(appGroup.endTimeSelection))")
            
            Text("Selected Weekdays: \(formatWeekdays(appGroup.weekdaySelected))")
            
            // Add additional properties from the AppGroup object as needed
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
    
    // Helper function to format time
    func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    // Helper function to format weekdays
    func formatWeekdays(_ weekdays: [Bool]) -> String {
        let weekdaySymbols = Calendar.current.weekdaySymbols
        var selectedWeekdays: [String] = []
        
        for (index, isSelected) in weekdays.enumerated() {
            if isSelected {
                selectedWeekdays.append(weekdaySymbols[index])
            }
        }
        
        return selectedWeekdays.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
