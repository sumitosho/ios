//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Apple on 01/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
enum Operation : String{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8{
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
        }
    }
    
    @IBAction func allclearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .Null
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
        runningNumber += "."
        outputLbl.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func plusPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func SubtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    func operation(operation:Operation){
        if currentOperation  != .Null {
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double (rightValue)!)"
                    
                }else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double (rightValue)!)"
                    
                }else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double (rightValue)!)"
                    
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double (rightValue)!)"
                    
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result  = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = operation
            
        }else  {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

