//
//  AppGroupViewModel.swift
//  Quit-Social
//
//  Created by Tony Jiang on 5/14/23.
//

import FamilyControls
import Foundation

class AppGroupViewModel: ObservableObject {
    @Published var appGroup: AppGroup
    init() {
        appGroup = AppGroup()
    }

    init(data: Data?) {
        guard let group = AppGroupViewModel.decodeGroup(data: data) else {
            print("Not valid data for App Group")
            appGroup = AppGroup()
            return
        }
        appGroup = group
    }

    init(group: AppGroup?) {
        if let group = group {
            appGroup = group
        } else {
            appGroup = AppGroup()
        }
    }

//    func saveGroup() {
//        let encoder = JSONEncoder()
//        if let encodedData = try? encoder.encode(appGroup) {
//            UserDefaults.standard.set(encodedData, forKey: "\(appGroup.key)")
//        }
//        if let appGroupsString = UserDefaults.standard.string(forKey: "AppGroups") {
//            let newAppGroupsString = appGroupsString + "\(appGroup.key),"
//            UserDefaults.standard.set(newAppGroupsString, forKey: "AppGroups")
//        } else {
//            let groupsString = "\(appGroup.key),"
//            UserDefaults.standard.set(groupsString, forKey: "AppGroups")
//        }
//        // add uuid to list of groups
//    }
    func saveGroup() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(appGroup) {
            UserDefaults.standard.set(encodedData, forKey: "AppGroup")
        }
    }

    static func decodeGroup(data: Data?) -> AppGroup? {
        let decoder = JSONDecoder()
        if let group = try? decoder.decode(AppGroup.self, from: data!) {
            return group
        }
        return nil
    }
}

class AppGroup: Identifiable, Codable {
    var key = UUID()
    var selection = FamilyActivitySelection()
    var timeLimitSelection = 0
    var startTimeSelection = Calendar(identifier: .gregorian).startOfDay(for: Date())
    var endTimeSelection = Calendar(identifier: .gregorian).startOfDay(for: Date()).addingTimeInterval(TimeInterval(86340))
    var weekdaySelected: [Bool] = [true, true, true, true, true, true, true]
    var groupName = ""
}
