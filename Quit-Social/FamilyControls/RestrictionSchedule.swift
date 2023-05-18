//
//  RestrictionSchedule.swift
//  Quit-Social
//
//  Created by Tony Jiang on 4/1/23.
//

import Foundation
import DeviceActivity

extension DeviceActivityName {
    static let daily = Self("daily")
}

extension DeviceActivityEvent.Name {
    static let discouraged = Self("discouraged")
}

class RestrictionSchedule {
    static let schedule = DeviceActivitySchedule(
        intervalStart: DateComponents(hour:0, minute: 0), intervalEnd: DateComponents(hour: 11, minute: 59), repeats: true
    )
    
    static public func setSchedule(minutes: Int) {
        let events: [DeviceActivityEvent.Name: DeviceActivityEvent] = [
            .discouraged: DeviceActivityEvent(applications: AppSelection.shared.selections.applicationTokens, threshold: DateComponents(minute: minutes))
        ]
        let center = DeviceActivityCenter()
        do {
            print("Try to start monitoring... ")
            try center.startMonitoring(.daily, during: schedule, events: events)
        } catch {
            print("Error monitoring schedule: ", error)
        }
    }
}

