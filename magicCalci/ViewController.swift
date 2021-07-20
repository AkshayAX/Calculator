//
//  ViewController.swift
//  magicCalci
//
//  Created by Akshaya Kumar N on 10/1/18.
//  Copyright © 2018 Akshaya Kumar N. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController
{
    
    
    @IBOutlet weak var output: UITextField!
   
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case pow = "^"
        case log = "log"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
   
    @IBAction func numberPressed(sender: UIButton) {
        
        runningNumber += "\(sender.tag)"
        output.text = runningNumber
    }
    
    
  
    @IBAction func divide(_ sender: Any) {
        
        processOperation(operation: .Divide)
    }
    
    
    @IBAction func subtract(_ sender: Any) {
        
        processOperation(operation: .Subtract)
    }
    
    @IBAction func multiplicate(_ sender: Any) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func log(_ sender: Any)
    {
        processOperation(operation: .log)
    }
    @IBAction func add(_ sender: Any) {
        processOperation(operation: .Add)
    }
    @IBAction func equate(_ sender: Any) {
        processOperation(operation: currentOperation)
    }
    @IBAction func square(_ sender: Any)
    {
        result = String( Double(output.text!)! * Double(output.text!)!)
        output.text = result
    }
    
    @IBAction func power(_ sender: Any)
    {
        
        processOperation(operation: .pow)
        output.text = result
        
    }
    
    
    
    
    @IBAction func Clear(_ sender: Any)
    {
        
     output.text = ""
        runningNumber = ""
        leftValStr = ""
        rightValStr = ""
        result = ""
currentOperation = Operation.Empty
    }
    
    
    
    @IBAction func cube(_ sender: Any)
    {
        
       result = String(Double(output.text!)! * Double(output.text!)! * Double(output.text!)!)
      output.text = result
    }
    
    
    @IBAction func squareRoot(_ sender: Any)
    {
        
        result = String(sqrt(Double(output.text!)!))
        output.text = result
        
    }
    
    
    
    func processOperation(operation: Operation) {
        
        
        
        if currentOperation != Operation.Empty {
            
            
            if runningNumber != "" {
                
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                    
                    
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                else if currentOperation == Operation.pow
                {
                    result = "\(pow(Double(leftValStr)!, Double(rightValStr)!))"
                    
                }
                else if currentOperation == Operation.log
                {
                }
                
                leftValStr = result
                output.text = result
            }
            
            currentOperation = operation
        }
        else
        {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    
}


    
