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
    
    func setNumber(_: Double?) {
        
    }
    
    func calculateIt(_ calcMethod: String) -> Double? {
        
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
