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
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10,15,20,25,0]
    
    let currency = FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currencyCode ?? "USD")
    
    var totalPerPerson: Double {
        return (checkAmount * (1 + Double(tipPercentage)/100)) / Double(numberOfPeople + 2)
    }
    
    var totalAmount: Double {
        return (checkAmount * (1 + Double(tipPercentage)/100))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) { number in
                            Text("\(number)")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text("\($0) %")
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                
                Section {
                    Text(totalPerPerson, format: currency)
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalAmount, format: currency)
                } header: {
                    Text("Total amount")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
