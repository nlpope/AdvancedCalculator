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
                
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let buttonValue  = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = buttonValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + buttonValue
            }
            
        }

//        if let buttonValue = sender.currentTitle {
//            numArray.append(buttonValue)
//            let toDisplay = numArray.joined(separator: "")
//            displayLabel.text = toDisplay
//        }
    

    }

}

