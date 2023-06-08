//
//  AppGroupView.swift
//  Quit-Social
//
//  Created by Tony Jiang on 4/10/23.
//

import FamilyControls
import SwiftUI

struct AppGroupView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var activityPickerPresented = false
    @State var title = ""
    @State private var showTimeLimitInfo = false
    @StateObject private var appSelection = AppSelection.shared
    @ObservedObject var appGroupViewModel: AppGroupViewModel
    func toTimeString(_ selection: Int) -> String {
        if selection < 4 {
            return "\(selection * 15) mins"
        }
        else if (selection * 15) % 60 == 0 {
            return "\(selection / 4) hour"
        }
        else {
            return "\(selection / 4) hour \((selection * 15) % 60) mins"
        }
    }

    func saveRestrictions() {
        appGroupViewModel.saveGroup()
        presentationMode.wrappedValue.dismiss()
        appSelection.selections = appGroupViewModel.appGroup.selection
        appSelection.setShieldRestrictions()
        RestrictionSchedule.setSchedule(minutes: appGroupViewModel.appGroup.timeLimitSelection * 15)
//        print("Saving \(appGroupViewModel.appGroup.selection.applicationTokens.count) apps")
//        appSelection.selections = appGroupViewModel.appGroup.selection
//        appSelection.setShieldRestrictions()
//        print("Time limit is \(toTimeString(appGroupViewModel.appGroup.timeLimitSelection))")
//        RestrictionSchedule.setSchedule(minutes: appGroupViewModel.appGroup.timeLimitSelection * 15)
    }

    var body: some View {
        VStack {
            HStack {
                Text("Apps to Block")
                Spacer()
                Button("Select") {
                    activityPickerPresented = true
                }.familyActivityPicker(isPresented: $activityPickerPresented, selection: $appGroupViewModel.appGroup.selection).onChange(of: appGroupViewModel.appGroup.selection) { _ in
                }
            }
            HStack {
                Text("Time Limit")
                Image(systemName: "info.circle").onTapGesture {
                    self.showTimeLimitInfo = true
                }.sheet(isPresented: self.$showTimeLimitInfo) {
                    Text("Selected apps can only be used for a combined " + toTimeString(appGroupViewModel.appGroup.timeLimitSelection)).font(.body
                    ).padding().presentationDetents([.fraction(0.1)])
                }
                Spacer()
                Picker("Time Limit", selection: $appGroupViewModel.appGroup.timeLimitSelection) {
                    ForEach(0 ..< 9) {
                        Text(toTimeString($0))
                    }
                }.padding(.horizontal, -15)
            }
            WeekdaySelect(weekdaySelected: $appGroupViewModel.appGroup.weekdaySelected)
            Spacer().frame(height: 20)
            DatePicker("Enter start time", selection: $appGroupViewModel.appGroup.startTimeSelection, displayedComponents: .hourAndMinute)
            DatePicker("Enter end time", selection: $appGroupViewModel.appGroup.endTimeSelection, displayedComponents: .hourAndMinute)
            Spacer().frame(height: 20)
            TextField("Group Name", text: $appGroupViewModel.appGroup.groupName).font(.title2)
            Divider()
            HStack {
                Spacer()
                Button("Save") {
                    saveRestrictions()
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
        AppGroupView(appGroupViewModel: AppGroupViewModel())
    }
}
