//
//  ContentView.swift
//  WeSplit
//
//  Created by viewmotion on 2020/01/06.
//  Copyright © 2020 viewmotion. All rights reserved.
//




import SwiftUI


// MARK: - https://www.hackingwithswift.com/100/swiftui/16
//struct ContentView: View {
//    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = 0
//
//    var body: some View {
//        VStack {
//            Picker("Select your student", selection: $selectedStudent) {
//                ForEach(0 ..< students.count) {
//                    Text(self.students[$0])
//                }
//            }
//            Text("Your chose: Student # \(students[selectedStudent])")
//        }
//    }
//}

// MARK: - https://www.hackingwithswift.com/100/swiftui/17
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmout = Double(checkAmount) ?? 0

        let tipValue = orderAmout / 100 * tipSelection
        let grandTotal = orderAmout + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
