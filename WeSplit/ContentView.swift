//
//  ContentView.swift
//  WeSplit
//
//  Created by viewmotion on 2020/01/06.
//  Copyright © 2020 viewmotion. All rights reserved.
//



/*
 https://www.hackingwithswift.com/100/swiftui/16
 */
import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("Your chose: Student # \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
