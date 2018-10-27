//
//  ViewController.swift
//  calculator1
//
//  Created by 韩蕊泽 on 2018/10/22.
//  Copyright © 2018年 韩蕊泽. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var screenL: UILabel!
    
    var value1: Double = 0.0
    var value2: Double = 0.0
    var result: Double = 0.0
    var decimalPointFlag: Bool = false
    var isValue2: Bool = false
    var operatorFlag: String = ""
    
    @IBAction func number(_ sender: UIButton) {
        if screenL.text == "0" || (isValue2 && value2 == 0.0)
        {screenL.text = ""}
        screenL.text = screenL.text! + sender.currentTitle!
        /*if !isValue2 {
            value1 = NSString(string: screenL.text!).doubleValue        }
        else {
            value2 = NSString(string: screenL.text!).doubleValue        }*/
    }
    @IBAction func point(_ sender: UIButton) {
        if !decimalPointFlag{
            screenL.text = screenL.text! + "."
        }
        decimalPointFlag = true
    }
    @IBAction func sign(_ sender: UIButton) {
        if value1 != 0.0
        {
            decimalPointFlag = false
            isValue2 = true
            value1 = NSString(string: screenL.text!).doubleValue
            switch sender.currentTitle!{
                case "+" : operatorFlag = "+"
                case "-" : operatorFlag = "-"
                case "×" : operatorFlag = "*"
                case "÷" : operatorFlag = "/"
                default : break //or operatorFlag = "" ??
            }
        }
    }
    @IBAction func resultSign(_ sender: UIButton) {
        value2 = NSString(string: screenL.text!).doubleValue
        if (operatorFlag == "/" && value2 == 0.0){
            screenL.text = "Error: Divisor must not be zero."
            operatorFlag = ""
        }
        switch operatorFlag {
            case "+" : result = value1 + value2
            case "-" : result = value1 - value2
            case "*" : result = value1 * value2
            case "/" : result = value1 / value2
            default : break
        }
        screenL.text = "\(result)"
    }
    @IBAction func persentSign(_ sender: UIButton) {
        
    }
    @IBAction func allClear(_ sender: UIButton) {
        value1 = 0.0
        value2 = 0.0
        result = 0.0
        decimalPointFlag = false
        isValue2 = false
        operatorFlag = ""
    }
}
