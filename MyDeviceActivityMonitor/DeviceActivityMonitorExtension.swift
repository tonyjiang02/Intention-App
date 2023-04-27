//
//  DeviceActivityMonitorExtension.swift
//  MyDeviceActivityMonitor
//
//  Created by Tony Jiang on 4/3/23.
//

import DeviceActivity
import ManagedSettings
// Optionally override any of the functions below.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.

class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    let store = ManagedSettingsStore()
    let model = AppSelection.shared
    override func intervalDidStart(for activity: DeviceActivityName) {
        print("Interval did start")
        print(activity)
        super.intervalDidStart(for: activity)
        
        // Handle the start of the interval.
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        print("Interval did end")
        print(activity)
        super.intervalDidEnd(for: activity)
        
        // Handle the end of the interval.
    }
    
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        print("Interval did reach threshold")
        print(activity)
        
        super.eventDidReachThreshold(event, activity: activity)
        
        // Handle the event reaching its threshold.
    }
    
    override func intervalWillStartWarning(for activity: DeviceActivityName) {
        print("Interval will start")
        print(activity)
        model.setShieldRestrictions()
        super.intervalWillStartWarning(for: activity)
        
        // Handle the warning before the interval starts.
    }
    
    override func intervalWillEndWarning(for activity: DeviceActivityName) {
        print("Interval will end")
        print(activity)
        super.intervalWillEndWarning(for: activity)
        
        // Handle the warning before the interval ends.
    }
    
    override func eventWillReachThresholdWarning(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        print("Interval will reach threshold")
        print(activity)
        super.eventWillReachThresholdWarning(event, activity: activity)
        
        // Handle the warning before the event reaches its threshold.
    }
}
