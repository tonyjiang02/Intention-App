//
//  ScoreBoardView.swift
//  Quit-Social
//
//  Created by Tony Jiang on 4/27/23.
//

import SwiftUI

struct ScoreBoardView: View {
    @State var people = [Person]()
    init() {
        for i in 1...10{
            people.append(Person(name: "Person \(i)", score: Int(arc4random_uniform(100)) + 1))
        }
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class Person {
    var name: String
    var score: Int
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
    }
}
