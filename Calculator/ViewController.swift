//
//  ViewController.swift
//  Calculator
//
//  Created by Roc.iMac01 on 2018/5/30.
//  Copyright © 2018年 Roc.iMac01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userisTypeing = false
    
    @IBAction func touchButtonSeven(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userisTypeing {
            let textOnLabel = display.text!
            display.text = textOnLabel + digit
        }else{
            display.text = digit
            userisTypeing = true
        }
    }
    
    var displayDouble: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text!  = String(newValue)
        }
    }
    private var brainModel : CalcluatorBrain = CalcluatorBrain()
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userisTypeing {
            brainModel.setOperand(displayDouble)
            userisTypeing = false
        }
        
        if let mathSymbol = sender.currentTitle {
            brainModel.performOperation(mathSymbol)
        }
        if let result = brainModel.result {
            displayDouble = result
        }
    }
    
}

