//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

//test comment for git

import UIKit



class ViewController: UIViewController {
    
//    var numArray: [String] = []

    @IBOutlet weak var displayLabel: UILabel!
    
    //private = only accessible between the curly braces it rests in
    //you wont accidently modify something via another class
    private var isFinishedTypingNumber: Bool = true

    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        //isFinishedTypingNumber = "tracker"
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double.")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            else if calcMethod == "%" {
                
                displayLabel.text = String(number/100)
            }
        }
                
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let buttonValue  = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = buttonValue
                isFinishedTypingNumber = false
            } else {
                if buttonValue == "." {
                                        
                    decimal.isEnabled = false
                    
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("could not convert display label text to a Double")
                    }
                    
                    let isInt = floor(currentDisplayValue)
                }
                displayLabel.text = displayLabel.text! + buttonValue
            }
            
        }

        //OG CODE BY ME
//        if let buttonValue = sender.currentTitle {
//            numArray.append(buttonValue)
//            let toDisplay = numArray.joined(separator: "")
//            displayLabel.text = toDisplay
//        }
    

    }

}

