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
        case Equal     = "="
        case Empty     = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    var currentOperation: Operation = Operation.Empty
    
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
        buttonSound.play()
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
    }
    
    @IBAction func onSubstractPressed(sender: AnyObject) {
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
    }
}

