//
//  Quit_SocialApp.swift
//  Quit-Social
//
//  Created by Tony Jiang on 3/30/23.
//

import SwiftUI
import FamilyControls
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
                ContentView()
            case .denied:
                ApprovalView()
            case .notDetermined:
                ApprovalView()
            }
        }
    }
}
