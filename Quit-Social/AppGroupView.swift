//
//  AppGroupView.swift
//  Quit-Social
//
//  Created by Tony Jiang on 4/10/23.
//

import SwiftUI
import FamilyControls

struct AppGroupView: View {
    @State var activityPickerPresented = false
    @State var selection = FamilyActivitySelection()
    @State var timeLimitSelection = 0
    @State var startTimeSelection = Calendar(identifier: .gregorian).startOfDay(for: Date())
    @State var endTimeSelection = Calendar(identifier: .gregorian).startOfDay(for: Date()).addingTimeInterval(TimeInterval(86340))
    @State private var showTimeLimitInfo = false
    @StateObject var appSelection = AppSelection.shared
    @State var weekdaySelected: [Bool] = [true, true, true, true, true, true, true]
    @State var groupName = ""
    func toTimeString(_ selection: Int) -> String {
        if selection < 4 {
            return "\(selection * 15) mins"
        }
        else if (selection * 15) % 60 == 0 {
            return "\(selection / 4) hour"
        }
        else {
            return "\(selection / 4) hour \((selection * 15)%60) mins"
        }
    }
    var body: some View {
        VStack {
            HStack {
                Text("Apps to Block")
                Spacer()
                Button("Select") {
                    activityPickerPresented = true
                }.familyActivityPicker(isPresented: $activityPickerPresented, selection: $selection).onChange(of: selection) { newSelection in
                    
                }
            }
            HStack{
                Text("Time Limit")
                Image(systemName: "info.circle").onTapGesture {
                    self.showTimeLimitInfo = true
                }.sheet(isPresented: $showTimeLimitInfo) {
                    Text("Selected apps can only be used for a combined " + toTimeString(timeLimitSelection)).font(.body
                    ).padding().presentationDetents([.fraction(0.1)])
                }
                Spacer()
                Picker("Time Limit", selection: $timeLimitSelection) {
                    ForEach(0 ..< 9) {
                        Text(toTimeString($0))
                    }
                }.padding(.horizontal, -15)
            }
            WeekdaySelect(weekdaySelected: $weekdaySelected)
            Spacer().frame(height: 20)
            DatePicker("Enter start time", selection: $startTimeSelection, displayedComponents: .hourAndMinute)
            DatePicker("Enter end time", selection: $endTimeSelection, displayedComponents: .hourAndMinute)
            Spacer().frame(height:20)
            TextField("Group Name", text: $groupName).font(.title2)
            Divider()
            HStack {
                Spacer()
                Button("Save") {
                    
                }.foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                    .background(.blue)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue)
                    )
                Spacer()
            }
        }.padding()
    }
}

struct AppGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AppGroupView()
    }
}
