//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Brock Donahue on 11/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func DeterminePrecisePercent( sender: UISlider){
        let tipPercentage = Double(tipSlider.value)
        let tipsInPercent = String(format: "%.2f", tipPercentage)
        print(tipsInPercent)
        if tipsInPercent == "0.10"{
            tipSlider.setValue(0.1, animated: true)
            tipControl.selectedSegmentIndex = 0
        }
        else if tipsInPercent == "0.15"{
            tipSlider.setValue(0.15, animated: true)
            tipControl.selectedSegmentIndex = 1
        }
        else if tipsInPercent == "0.20"{
            tipSlider.setValue(0.2, animated: true)
            tipControl.selectedSegmentIndex = 2
        }
        else{
            tipControl.selectedSegmentIndex = -1
        }
       CalculateTips(tipSlider!)
    }
    
    @IBAction func DetermineRoughPercent( sender: UISegmentedControl){
        let tipPercentages = [0.10, 0.15, 0.20]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        tipSlider.setValue(Float(tipPercentage), animated:true)
        CalculateTips(tipControl!)
    }
    
    @IBAction func CalculateTips(_ sender: Any) {
        // Get bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        // Calculate tip and total amount
        let tipPercentage = Double(tipSlider.value)
        let tipsInPercent = tipPercentage * 100
        let tip = bill * tipPercentage
        let total = bill + tip

        // Update tip and total amount
        tipAmountLabel.text = String(format:"%@%.2f", "$", tip)
        totalAmountLabel.text = String(format:"%@%.2f", "$", total)
        tipPercentageLabel.text = String(format:"%.2f%@", tipsInPercent, "%")
    }
}
