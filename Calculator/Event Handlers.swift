//
//  File.swift
//  Calculator
//
//  Created by Cik Nur Maasyitah on 21/01/2026.
//

import Foundation
internal import Combine

class EventHandler: ObservableObject {
    
    @Published var calculatorDisplay: String = "0"
    
    var newNumber: Bool = true
    
    var firstNumber: String = ""
    
    var secondNumber: String = ""
    
    var calculationOperator: String = ""

    //assigns the value of the button pressed to calculator display
    func digitButtonPressed(digit: String) {
        if newNumber {
            calculatorDisplay = digit
            newNumber = false
        } else {
            calculatorDisplay += digit
        }
    }
    
    //resets the display to 0
    func buttonACPressed() {
        calculatorDisplay = "0"
        newNumber = true
    }
    
    //selects the operator based on the operator button pressed
    func operatorButtonPressed(operatorChosen: String){
        calculationOperator = operatorChosen
        firstNumber = calculatorDisplay
        calculatorDisplay = "0"
    }
    
    func equalSignButtonPressed() {
        let number1: Int = Int(firstNumber)!
        let number2: Int = Int(secondNumber)!
        var result: Int = 0
        
        switch calculationOperator {
        case "+":
            result = number1 + number2
            calculatorDisplay = "\(result)"
        case "-":
            result = number1 - number2
            calculatorDisplay = "\(result)"
        case "X":
            result = number1 * number2
            calculatorDisplay = "\(result)"
        case "/":
            result = number1 / number2
            calculatorDisplay = "\(result)"
        default:
            calculatorDisplay = "error"
        }
    }
}
