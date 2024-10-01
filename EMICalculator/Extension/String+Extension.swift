//
//  String+Extension.swift
//  EMICalculator
//
//  Created by Alfonso Gonzalez Miramontes on 01/10/24.
//

import Foundation

extension String{
    var isNumberAndNotEmpty: Bool{
        return !self.isEmpty && Double(self) != nil
    }
}
