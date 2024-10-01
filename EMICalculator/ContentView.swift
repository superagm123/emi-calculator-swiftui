//
//  ContentView.swift
//  EMICalculator
//
//  Created by Alfonso Gonzalez Miramontes on 01/10/24.
//

import SwiftUI

//Formula: p x r x (1+r)^n / (1+r)^n - 1

struct ContentView: View{
    
    @State private var loanAmount: String = ""
    @State private var interestRate: String = ""
    @State private var years: String = ""
    @State private var months: String = ""
    @State private var emi: Double = 0
    @State private var totalPayment: Double = 0
    @State private var totalInterest: Double = 0
    
    private var isFormValid: Bool {
        return loanAmount.isNumberAndNotEmpty && interestRate.isNumberAndNotEmpty && years.isNumberAndNotEmpty &&
        months.isNumberAndNotEmpty
    }
    
    private func calculateEMI(){
        let rate = Double(interestRate)!/12/100
        let time = Double(years)! * 12 + Double(months)!
        emi = (Double(loanAmount)! * rate * pow(1+rate, time)) / (pow(1+rate, time) - 1)
        
        calculateTotalPayment()
        calculateTotalInterest()
        cleanFields()
    }
    
    private func calculateTotalPayment(){
        totalPayment = emi * (Double(years)! * 12 + Double(months)!)
    }
    
    private func calculateTotalInterest(){
        totalInterest = totalPayment - Double(loanAmount)!
    }
    
    private func cleanFields(){
        loanAmount = ""
        interestRate = ""
        years = ""
        months = ""
    }
    
    var body: some View{
        Form{
            Section("Loan Amount & interest rate"){
                TextField("Enter loan amount", text: $loanAmount)
                TextField("Enter interest rate", text: $interestRate)
            }
            Section("Loan Term"){
                TextField("years", text: $years)
                TextField("months", text: $months)
            }
            if emi != 0{
                Section("Results"){
                    Text("Monthly payment: \(Text(emi as NSNumber, formatter: NumberFormatter.currency).foregroundStyle(.red))")
                    Text("Total payment: \(Text(totalPayment as NSNumber, formatter: NumberFormatter.currency).foregroundStyle(.red))")
                    Text("Total Interest: \(Text(totalInterest as NSNumber, formatter: NumberFormatter.currency).foregroundStyle(.red))")
                    
                }
            }
            Button("Calculate"){
                calculateEMI()
            }.disabled(!isFormValid)
            .foregroundStyle(.green)
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle("EMI Calculator")
    }
}

#Preview{
    NavigationStack{
        ContentView()
    }
}
