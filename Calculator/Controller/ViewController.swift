//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
// testing new token after usiung newly regenerated token into xcode account preferenceces > Github

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var displayLabel: UILabel!
    
    
    //private = only accessible between the curly braces it rests in
    //you wont accidently modify something via another class
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        //get currentvalue from displayLabel.text
        get {
            guard let currentValue = Double(displayLabel.text!) else {
                fatalError("could not convert display label text to a Double")
            }
            return currentValue
            
        }
        //create setter that sets the display label whenever displayvalue is updated
        set {
            if newValue == 0 {
                displayLabel.text = "0"
            } else {
            displayLabel.text = String(newValue)
            }
        }
    }
    
    //set all global variables to private by default
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        //isFinishedTypingNumber = "tracker"
        isFinishedTypingNumber = true
        
        //getting the displayvalue # over to the logic
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
                  
            //calculateIt() can return nil so keep the guard
            guard let result = calculator.calculateIt(calcMethod) else {return}
            
            displayValue = result

        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let buttonValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = buttonValue
                isFinishedTypingNumber = false
            } else {
                if buttonValue == "." && displayLabel.text!.contains(".") {
                    return
                }
                
                displayLabel.text = displayLabel.text! + buttonValue
            }
            
        }
        
             
        
        
    }
    
}






/**
 OG Snippets
 
 if buttonValue == "." {
 
 let isInt = floor(displayValue) == displayValue
 
 if !isInt {
 return
 //exit before we can add it w the step below
 //otherwise move down and add the "." to displayLabel.text
 }
 }
 
 why i got rid of it: better to just scan for the "." charcter to avoid the double ".." crash problem
 source: Massimo Udemy video 307
 
 ----------------
 
 if let buttonValue = sender.currentTitle {
     numArray.append(buttonValue)
     let toDisplay = numArray.joined(separator: "")
     displayLabel.text = toDisplay
 }
 
 testing 10/11
 
 */

