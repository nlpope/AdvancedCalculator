//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Noah Pope on 9/28/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    func calculateIt(_ calcMethod: String, _ displayValue: Double) -> Double {
        var returnedValue = displayValue
        
        if calcMethod == "+/-" {
            //displayValue gets a newValue, triggering the setter
            returnedValue *= -1
        }
        else if calcMethod == "AC" {
            returnedValue = 0
        }
        else if calcMethod == "%" {
            returnedValue *= 0.01
        }
        
        return returnedValue
    }
    
}
