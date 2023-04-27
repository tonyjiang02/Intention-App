//
//  WeekdaySelect.swift
//  Quit-Social
//
//  Created by Tony Jiang on 4/16/23.
//

import SwiftUI

struct WeekdaySelect: View {
    @Binding var weekdaySelected: [Bool]
    var body: some View {
        HStack {
            VStack {
                Text("Mo")
                ZStack {
                    Circle().stroke(Color.black).contentShape(Circle()).onTapGesture {
                        weekdaySelected[0] = !weekdaySelected[0]
                    }
                    if weekdaySelected[0] {
                        Image(systemName: "checkmark")
                    }
                }
            }
            VStack {
                Text("Tu")
                ZStack {
                    Circle().stroke(Color.black).contentShape(Circle()).onTapGesture {
                        weekdaySelected[1] = !weekdaySelected[1]
                    }
                    if weekdaySelected[1] {
                        Image(systemName: "checkmark")
                    }
                }
            }
            VStack {
                Text("We")
                ZStack {
                    Circle().stroke(Color.black).contentShape(Circle()).onTapGesture {
                        weekdaySelected[2] = !weekdaySelected[2]
                    }
                    if weekdaySelected[2] {
                        Image(systemName: "checkmark")
                    }
                }
            }
            VStack {
                Text("Th")
                ZStack {
                    Circle().stroke(Color.black).contentShape(Circle()).onTapGesture {
                        weekdaySelected[3] = !weekdaySelected[3]
                    }
                    if weekdaySelected[3] {
                        Image(systemName: "checkmark")
                    }
                }
            }
            VStack {
                Text("Fr")
                ZStack {
                    Circle().stroke(Color.black).contentShape(Circle()).onTapGesture {
                        weekdaySelected[4] = !weekdaySelected[4]
                    }
                    if weekdaySelected[4] {
                        Image(systemName: "checkmark")
                    }
                }
            }
            VStack {
                Text("Sa")
                ZStack {
                    Circle().stroke(Color.black).contentShape(Circle()).onTapGesture {
                        weekdaySelected[5] = !weekdaySelected[5]
                    }
                    if weekdaySelected[5] {
                        Image(systemName: "checkmark")
                    }
                }
            }
            VStack {
                Text("Su")
                ZStack {
                    Circle().stroke(Color.black).contentShape(Circle()).onTapGesture {
                        weekdaySelected[6] = !weekdaySelected[6]
                    }
                    if weekdaySelected[6] {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

struct WeekdaySelect_Previews: PreviewProvider {
    static var weekdaySelected: [Bool] = [true, true, true, true, true, true, true]
    static var previews: some View {
        StatefulPreviewWrapper(weekdaySelected) {
            WeekdaySelect(weekdaySelected: $0)
        }
    }
}
