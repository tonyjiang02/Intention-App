//
//  DashboardViewModel.swift
//  Quit-Social
//
//  Created by Tony Jiang on 5/14/23.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var groupDataList: [AppGroup] = []
    var currentlySelectedAppGroup: AppGroup?
    init() {
//        if let ids = UserDefaults.standard.string(forKey: "AppGroups") {
//            print(ids)
//            let groupIds = ids.components(separatedBy: ",")
//            for g in groupIds {
//                if let data = UserDefaults.standard.data(forKey: g) {
//                    if let groupData = AppGroupViewModel.decodeGroup(data: data) {
//                        groupDataList.append(groupData)
//                    } else {
//                        print("Not an App Group")
//                    }
//                } else {
//                    print("Not a valid key: \(g)")
//                }
//            }
//        }
        if let data = UserDefaults.standard.data(forKey: "AppGroup") {
            if let groupData = AppGroupViewModel.decodeGroup(data: data) {
                groupDataList.append(groupData)
            }
        }
        // look for app group in local storage
    }
}
