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
    
    //create as a touple that can store a string and a double?
    //global var: set private
    private var intermediateCalculation: (n1: Double, symbol: String)?
    
    mutating func setNumber(_ number: Double?) {
        self.displayNumber = number
    }
    
    mutating func calculateIt(_ calcMethod: String) -> Double? {
        
        if let n = displayNumber {
            if calcMethod == "+/-" {
                //displayValue gets a newValue, triggering the setter
                return n * -1
            }
            else if calcMethod == "AC" {
                return 0
            }
            else if calcMethod == "%" {
                return n * 0.01
            }
            else if calcMethod == "=" {
               return performTwoNumCalculation(n2: n)
            }
            else {
                intermediateCalculation = (n1: n, symbol: calcMethod)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double {
        // optional binding = if "interm...n1" is not nil, bind it to "nubmer1"
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.symbol {
            
            if operation == "+" {
                return n1 + n2
            }
    
        }
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
