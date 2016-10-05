//
//  ViewController.swift
//  HowManyFingers
//
//  Created by carole lang on 10/3/16.
//  Copyright © 2016 Dana Young. All rights reserved.
//
//test change for tom

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var fingerImage: UIImageView!
    @IBOutlet weak var enteredGuess: UITextField!
    {
        didSet
        {
            enteredGuess.delegate = self
        }
    }
    @IBOutlet weak var resultLabel: UILabel!
    
    let nameImageArray = [
        "IMG_2974",
        "IMG_2969",
        "IMG_2970",
        "IMG_2971",
        "IMG_2972",
        "IMG_2973"
        ]
    
    @IBAction func guessButton(_ sender: AnyObject) {
        
        self.enteredGuess?.resignFirstResponder()
        
        if enteredGuess.text != nil , let _ = Int(enteredGuess.text!) {
            let diceRoll = arc4random_uniform(UInt32(nameImageArray.count))
            let convertedGuess = Int(enteredGuess.text!)
            if convertedGuess! >= 0 && convertedGuess! <= 5
            {
                let newString: String = nameImageArray[Int(diceRoll)]
                fingerImage.image = UIImage(named: newString)
                
                if convertedGuess == Int(diceRoll)
                {
                    resultLabel.text = "Correct! The number of fingers was \(diceRoll)!"
                }
                else
                {
                    resultLabel.text = "Sorry! The correct number of fingers was \(diceRoll)!"
                }

            }
            else
            {
                resultLabel.text = "!Invalid! Please enter a number from 0-5."
            }
            
        }
        else
        {
            resultLabel.text = "!Invalid! Please enter a number from 0-5."
        }
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.becomeFirstResponder()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.enteredGuess?.resignFirstResponder()
        return true;
    }
}

