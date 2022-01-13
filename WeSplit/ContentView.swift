//
//  ContentView.swift
//  WeSplit
//
//  Created by Tomek on 09/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    let currencyCode = Locale.current.currencyCode ?? "USD"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyCode))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) { number in
                            Text("\(number)")
                        }
                    }
                }
                
                Section {
                    Picker("", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                
                Section {
                    Text(checkAmount, format: .currency(code: currencyCode))
                    Text("Selected \(numberOfPeople) people")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
