//
//  StatefulPreviewWrapper.swift
//  Quit-Social
//
//  Created by Tony Jiang on 4/16/23.
//

import Foundation
import SwiftUI
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
