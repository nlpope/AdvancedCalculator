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

    private var displayValue: Double {
        //get currentvalue from displayLabel.text
        get {
            guard let currentValue = Double(displayLabel.text!) else {
                fatalError("could not convert display label text to a Double")
            }
            return currentValue
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        //isFinishedTypingNumber = "tracker"
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(displayValue * -1)
            }
            else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            else if calcMethod == "%" {
                
                displayLabel.text = String(displayValue/100)
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
                                                            
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("could not convert display label text to a Double")
                    }
                    
                    //so basically isInt = true or false
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
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

