//
//  ContentView.swift
//  SplitEase
//
//  Created by Rohan Kadve on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    //Declaring variables being used
    @State private var TotalAmount = 0.0
    @State private var NumberOfPeople = 0
    @State private var TipPercentage = 0
    let TipPercentages = [0, 5, 10, 15, 20, 25]
    //Calculation part
    var TotalPerPerson: Double {
        let PeopleCount = Double(NumberOfPeople + 2)
        let TipSelection = Double(TipPercentage)
        
        let TipValue = TotalAmount / 100 * TipSelection
        let GrandTotal = TotalAmount + TipValue
        let AmountPerPerson = GrandTotal / PeopleCount
        
        return AmountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    //Text feild to add total amount in Indian currency
                    TextField("Total Amount", value: $TotalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $NumberOfPeople) {
                        ForEach(2..<100) { people in
                            Text("\(people) people")
                        }
                    }
                }
                //Adding tip percetage
                Section(header: Text("How much do you want to tip?")) {
                    Picker("Tip percentage", selection: $TipPercentage) {
                        ForEach(TipPercentages, id: \.self) { percentage in
                            Text("\(percentage)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                //for selecting total number of people
                Section(header: Text("Total per person")) {
                    
                    Text("\(TotalPerPerson, specifier: "%.2f") \(Locale.current.currency?.identifier ?? "INR")")
                }
                .navigationTitle("SplitEase App")//Title being shown at top
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
