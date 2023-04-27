//
//  SelectedView.swift
//  Quit-Social
//
//  Created by Tony Jiang on 3/31/23.
//

import SwiftUI
import ManagedSettings
struct SelectedView: View {
    @EnvironmentObject var appSelection: AppSelection
    init() {
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SelectedView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedView()
    }
}
