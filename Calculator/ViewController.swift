//
//  ViewController.swift
//  Calculator
//
//  Created by Roc.iMac01 on 2018/5/30.
//  Copyright © 2018年 Roc.iMac01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    var userisTypeing = false

    @IBAction func touchButtonSeven(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userisTypeing {
            let textInLabel = result.text!
            result.text = textInLabel + digit
        }else{
            result.text = digit
            userisTypeing = true
        }
    }
    
    var resultDouble: Double {
        get {
            return Double(result.text!)!
        }
        set {
            result.text! = String(newValue)
        }
    }
    @IBAction func performOperation(_ sender: UIButton) {
        userisTypeing = false
        
        if let mathMaticolSymbol = sender.currentTitle {
            switch mathMaticolSymbol{
            case "π":
                result.text  = "\(Double.pi)"
            case "√":
                let midVar = Double(result.text!)!
                result.text = String(sqrt(midVar))
            default:
                break
            }
        }
    }
    
}

