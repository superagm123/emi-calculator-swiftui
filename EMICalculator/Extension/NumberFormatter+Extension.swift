//
//  NumberFormatter+Extension.swift
//  EMICalculator
//
//  Created by Alfonso Gonzalez Miramontes on 01/10/24.
//

import Foundation

extension NumberFormatter{
    static var currency: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter 
    }
}
