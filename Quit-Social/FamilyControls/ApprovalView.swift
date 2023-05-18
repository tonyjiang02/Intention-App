//
//  ApprovalView.swift
//  Quit-Social
//
//  Created by Tony Jiang on 3/31/23.
//

import SwiftUI
import FamilyControls

struct ApprovalView: View {
    func requestPermissions() async -> Void {
        do {
            try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
        } catch {
        }
    }
    var body: some View {
        Text("Hi, this app needs some permissions to operate")
        Button("Allow Permissions") {
            Task {
                await requestPermissions()
            }
        }
    }
}

struct ApprovalView_Previews: PreviewProvider {
    static var previews: some View {
        ApprovalView()
    }
}
