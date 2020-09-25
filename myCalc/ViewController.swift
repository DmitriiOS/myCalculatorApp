//
//  ViewController.swift
//  myCalc
//
//  Created by 1 on 18.09.2020.
//  Copyright © 2020 DmitriOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonAC: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonPoint: UIButton!
    
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDevide: UIButton!
    @IBOutlet weak var buttonBackspace: UIButton!
    @IBOutlet weak var buttonChangeSign: UIButton!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    var number = ""
    var preResult = ""
    var arithmeticAction = ""
    var result = 0.0
    
    @IBAction func buttonACTapped(_ sender: Any) {
        number = ""
        printNumber(num: "0")
    }
    
    @IBAction func button0Tapped(_ sender: Any) {
        if number != "-0" {
            printNumber(num: "0")
        }
    }
    
    @IBAction func button1Tapped(_ sender: Any) {
        printNumber(num: "1")
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        printNumber(num: "2")
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        printNumber(num: "3")
    }
    
    @IBAction func button4Tapped(_ sender: Any) {
        printNumber(num: "4")
    }
    
    @IBAction func button5Tapped(_ sender: Any) {
        printNumber(num: "5")
    }
    
    @IBAction func button6Tapped(_ sender: Any) {
        printNumber(num: "6")
    }
    
    @IBAction func button7Tapped(_ sender: Any) {
        printNumber(num: "7")
    }
    
    @IBAction func button8Tapped(_ sender: Any) {
        printNumber(num: "8")
    }
    
    @IBAction func button9Tapped(_ sender: Any) {
        printNumber(num: "9")
    }
    
    @IBAction func buttonPointTapped(_ sender: Any) {
        if number == "0" {
            printNumber(num: "0.")
        }
        if !number.contains(".") {
            printNumber(num: ".")
        }
    }
    
    @IBAction func buttonPlusTapped(_ sender: Any) {
        arithmetics(sign: "plus")
    }
    
    @IBAction func buttonMinusTapped(_ sender: Any) {
        arithmetics(sign: "minus")
    }
    
    @IBAction func buttonMultiplyTapped(_ sender: Any) {
        arithmetics(sign: "multiply")
    }
    
    @IBAction func buttonDevideTapped(_ sender: Any) {
        arithmetics(sign: "devide")
    }
    
    @IBAction func buttonBackspaceTapped(_ sender: Any) {
        if number.contains("-") {
            if number.count > 2 {
                number.removeLast()
                numberLabel.text = number
            } else {
                number = "0"
                numberLabel.text = number
            }
        } else {
            if number.count > 1 {
                number.removeLast()
                numberLabel.text = number
            } else {
                number = "0"
                numberLabel.text = number
            }
        }
    }
    
    @IBAction func buttonChangeSignTapped(_ sender: Any) {
        if number.contains("-") {
            number.removeFirst()
            numberLabel.text = number
        } else {
            number = "-" + number
            numberLabel.text = number
        }
    }
    
    @IBAction func buttonEqualTapped(_ sender: Any) {
        count()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonBorder(button: buttonAC, color: UIColor.white)
        
        buttonBorder(button: button0, color: UIColor.systemBlue)
        buttonBorder(button: button1, color: UIColor.systemBlue)
        buttonBorder(button: button2, color: UIColor.systemBlue)
        buttonBorder(button: button3, color: UIColor.systemBlue)
        buttonBorder(button: button4, color: UIColor.systemBlue)
        buttonBorder(button: button5, color: UIColor.systemBlue)
        buttonBorder(button: button6, color: UIColor.systemBlue)
        buttonBorder(button: button7, color: UIColor.systemBlue)
        buttonBorder(button: button8, color: UIColor.systemBlue)
        buttonBorder(button: button9, color: UIColor.systemBlue)
        buttonBorder(button: button0, color: UIColor.systemBlue)
        buttonBorder(button: buttonPoint, color: UIColor.systemBlue)
        
        buttonBorder(button: buttonEqual, color: UIColor.blue)
        buttonBorder(button: buttonPlus, color: UIColor.blue)
        buttonBorder(button: buttonMinus, color: UIColor.blue)
        buttonBorder(button: buttonMultiply, color: UIColor.blue)
        buttonBorder(button: buttonDevide, color: UIColor.blue)
        buttonBorder(button: buttonBackspace, color: UIColor.blue)
        buttonBorder(button: buttonChangeSign, color: UIColor.blue)
    }
    
    func buttonBorder(button: UIButton, color: UIColor) {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = color.cgColor
        button.tintColor = color
    }
    
    func printNumber(num: String) {
        if number == "0" {
            number = ""
        }
        if number.count < 13 {
            number = number + num
            numberLabel.text = number
        }
    }
    
    func arithmetics(sign: String) {
        preResult = number
        arithmeticAction = sign
        numberLabel.text = "0"
        number = "0"
    }
    
    func count() {
        switch arithmeticAction {
        case "plus":
            result = Double(preResult)! + Double(number)!
        case "minus":
            result = Double(preResult)! - Double(number)!
        case "multiply":
            result = Double(preResult)! * Double(number)!
        case "devide":
            result = Double(preResult)! / Double(number)!
        default:
            result = 00
        }
        number = String(result)

        numberLabel.text = String(result)
    }
}

