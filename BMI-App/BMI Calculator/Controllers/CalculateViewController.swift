//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

  
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculateBrain = CalculatorBrain()
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {

        heightLabel.text = ("\(String(format: "%.2f", sender.value))m")
        
    }
    
    @IBAction func wieightSliderChanged(_ sender: UISlider) {
        
        weightLabel.text = ("\(String (Int(sender.value)))kg")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        //let BMI = weight / pow(height, 2)
       
        calculateBrain.calculateBMI(height: height, weight: weight)
        
        performSegue(withIdentifier: "gotoResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResult"{
            let destinationVC = segue.destination as! ResultViewContoller
            destinationVC.bmivalue = calculateBrain.getBMIValue()
            destinationVC.advice = calculateBrain.getAdvice()
            destinationVC.color = calculateBrain.getColor()
        
        }
        
    }
}

