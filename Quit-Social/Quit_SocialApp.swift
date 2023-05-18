//
//  Quit_SocialApp.swift
//  Quit-Social
//
//  Created by Tony Jiang on 3/30/23.
//

import FamilyControls
import SwiftUI
@main
struct Quit_SocialApp: App {
    @ObservedObject var center = AuthorizationCenter.shared
    init() {
        AppSelection.shared.clearShieldRestrictions()
    }

    var body: some Scene {
        WindowGroup {
            switch center.authorizationStatus {
            case .approved:
                TabNavigationView()
            case .denied:
                ApprovalView()
            case .notDetermined:
                ApprovalView()
            }
        }
    }
}
