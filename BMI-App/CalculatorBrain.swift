//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by ShreeThaanu on 03/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//
import UIKit

struct CalculatorBrain {
    
    
    var calculatedValue : BMI?

    mutating func calculateBMI (height : Float, weight : Float){
        let calValue = weight / (height * height)
        
        if calValue < 18.5 {
            print("UnderWeight")
            calculatedValue = BMI(value: calValue, advice: "Eat more pies!", color:#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if calValue < 24.9 {
            print("normalWeight")
            calculatedValue = BMI(value: calValue, advice: "FIt as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
            
        }else {
            print("overweight")
            calculatedValue = BMI(value: calValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        }
        
    
    }
    
    mutating func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", calculatedValue?.value ?? "0.0")
        return bmiValue
    }
    
    func getAdvice() -> String{
        
        return calculatedValue?.advice ?? "No advice"
        
    }
    
    func getColor() -> UIColor {
        return calculatedValue?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
