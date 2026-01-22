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
    
    @Published var calculationOperator: String = ""
    
    var newNumber: Bool = true
    
    var firstNumber: String = "0"
    
    var secondNumber: String = "0"
    
    
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
        firstNumber = "0"
        secondNumber = "0"
        calculationOperator = ""
        newNumber = true
    }
    
    
    //selects the operator based on the operator button pressed
    func operatorButtonPressed(operatorChosen: String) {
        calculationOperator = operatorChosen
        firstNumber = calculatorDisplay
        newNumber = true
    }
    
    func roundUp(_ value: Double, decimals: Int) -> Double {
        let factor = pow(10.0, Double(decimals))
        return ceil(value * factor) / factor
    }
    
    func equalSignButtonPressed() {
        
        //saves the digits pressed before pressing the equal button
        secondNumber = calculatorDisplay
        
        let number1: Double = Double(firstNumber) ?? 0
        let number2: Double = Double(secondNumber) ?? 0
        var result: Double = 0
        
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
            if number2 == 0 {
                calculatorDisplay = "Error"
                return
            }
            result = roundUp(number1 / number2, decimals: 2)
            calculatorDisplay = "\(result)"
        default:
            calculatorDisplay = "0"
        }
        newNumber = true
        firstNumber = "0"
        secondNumber = "0"
        calculationOperator = ""
    }
}
