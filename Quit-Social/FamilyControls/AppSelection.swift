//
//  AppSelection.swift
//  Quit-Social
//
//  Created by Tony Jiang on 3/31/23.
//

import Foundation
import ManagedSettings
import FamilyControls

class AppSelection: ObservableObject {
    @Published var selections: FamilyActivitySelection
    @Published var selected: Bool
    
    static let shared = AppSelection()
    let store = ManagedSettingsStore()
    
    init() {
        selected = false
        selections = FamilyActivitySelection()
    }
    func setShieldRestrictions() {
        store.shield.applications = selections.applicationTokens.isEmpty ? nil : selections.applicationTokens
        store.shield.applicationCategories = selections.categoryTokens.isEmpty ? nil : ShieldSettings.ActivityCategoryPolicy.specific(selections.categoryTokens)
    }
    func clearShieldRestrictions() {
        store.shield.applications = nil
        store.shield.applicationCategories = nil
    }
}
