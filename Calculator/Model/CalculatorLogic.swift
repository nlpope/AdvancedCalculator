//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Noah Pope on 9/28/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var displayNumber: Double?
    
    //create a touple that can store a string and a double?
    //global var: set private
    private var intermediateCalculation: (n1: Double, symbol: String)?
    
    mutating func setNumber(_ number: Double?) {
        self.displayNumber = number
    }
    
    mutating func calculateIt(_ calcMethod: String) -> Double? {
        
        print(displayNumber!)
        //problem child? calcMethod looks fine so im lookin at the n in intermediateCalc.. in the default
        if let n = displayNumber {
            
            switch calcMethod {
            case "+/-":
                //displayValue gets a newValue, triggering the setter in the view controller
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, symbol: calcMethod)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        // optional binding = if "interm...n1" is not nil, bind it to "n1"
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.symbol {
            print("n1 = \(n1), operation = \(operation)")
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError("The operation passed doesn't match any of the cases")
            }
           
        }
        return nil
    }
    
}

/**
 *OG calculateIt() func - mines*
 *Nixed it in favor if Angela's method - global var with an init to account for the displayValue*
 
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
 
 */
