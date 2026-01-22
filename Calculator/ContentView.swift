//
//  ContentView.swift
//  Calculator
//
//  Created by Cik Nur Maasyitah on 21/01/2026.
//

import SwiftUI



struct CalculatorView: View {
    
    @StateObject private var eventHandler = EventHandler()
    
    var body: some View {
        VStack {
            
            HStack (spacing: 12){
                //display text
                Text(eventHandler.calculatorDisplay)
                Text(eventHandler.calculationOperator)
            }
            
            //buttons row 1
            HStack(spacing: 12){
                Button("7") {
                    eventHandler.digitButtonPressed(digit: "7")
                }
                Button("8") {
                    eventHandler.digitButtonPressed(digit: "8")
                }
                Button("9") {
                    eventHandler.digitButtonPressed(digit: "9")
                }
                Button("+") {
                    eventHandler.operatorButtonPressed(operatorChosen: "+")
                }
            }
            
            //buttons row 2
            HStack(spacing: 12){
                Button("4") {
                    eventHandler.digitButtonPressed(digit: "4")
                }
                Button("5") {
                    eventHandler.digitButtonPressed(digit: "5")
                }
                Button("6") {
                    eventHandler.digitButtonPressed(digit: "6")
                }
                Button("-") {
                    eventHandler.operatorButtonPressed(operatorChosen: "-")
                }
            }
            
            //buttons row 3
            HStack(spacing: 12){
                Button("1") {
                    eventHandler.digitButtonPressed(digit: "1")
                }
                Button("2") {
                    eventHandler.digitButtonPressed(digit: "2")
                }
                Button("3") {
                    eventHandler.digitButtonPressed(digit: "3")
                }
                Button("X") {
                    eventHandler.operatorButtonPressed(operatorChosen: "X")
                }
            }
            
            //buttons row 4
            HStack(spacing: 12){
                Button("0") {
                    if !eventHandler.calculatorDisplay.hasPrefix("0") {
                        eventHandler.digitButtonPressed(digit: "0")
                    }
                }
                Button("AC") {
                    eventHandler.buttonACPressed()
                }
                Button("=") {
                    eventHandler.equalSignButtonPressed()
                }
                Button("/") {
                    eventHandler.operatorButtonPressed(operatorChosen: "/")
                }
            }
        }
        .padding()
    }
}

#Preview {
    CalculatorView()
}
