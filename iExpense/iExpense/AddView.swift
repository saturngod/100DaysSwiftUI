//
//  AddView.swift
//  iExpense
//
//  Created by Htain Lin Shwe on 12/03/2022.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name",text: $name)
                Picker("Type",selection: $type) {
                    ForEach(types,id:\.self) {
                        Text($0)
                    }
                }
                TextField("Amount",value:$amount,format: .currency(code: "USD")).keyboardType(.decimalPad)
            }
            .navigationTitle("Add New")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
