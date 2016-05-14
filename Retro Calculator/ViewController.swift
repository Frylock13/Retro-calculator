//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Vitaly Some on 5/12/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Add       = "+"
        case Substract = "-"
        case Multiply  = "*"
        case Divide    = "/"
        case Empty     = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var currentOperation: Operation = Operation.Empty
    var leftValue = ""
    var rightValue = ""
    var runningNumber = ""
    var result = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundUrl)
                buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(button: UIButton!) {
        playSound()

        runningNumber += "\(button.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onSubstractPressed(sender: AnyObject) {
        processOperation(Operation.Substract)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(operation: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            // Run some math
            
            // If not two operators in a row
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                switch operation {
                case Operation.Add:
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                case Operation.Substract:
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                case Operation.Multiply:
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                case Operation.Divide:
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                default:
                    true
                }
                
                leftValue = String(UTF8String: result)!
                outputLabel.text = result
            }
            
            currentOperation = operation
        } else {
            // This is the first time an operator has been pressed
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    func playSound() {
        if buttonSound.playing {
            buttonSound.stop()
        }
        
        buttonSound.play()
    }
}

