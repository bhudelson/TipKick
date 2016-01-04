//
//  ViewController.swift
//  TipKick
//
//  Created by Blake Hudelson on 11/27/15.
//  Copyright © 2015 Blake Hudelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var youpayTitle: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var personStepper: UIStepper!
    @IBOutlet weak var peepImage: UIImageView!
    
    @IBAction func personStepperValueChanged(sender: UIStepper) {
        personLabel.text = Int(sender.value).description
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personStepper.wraps = true
        personStepper.autorepeat = true
        personStepper.maximumValue = 10
        
        tipLabel.text = "$"
        totalLabel.text = "0.00"
        personLabel.text = "1"
        
        // Starting value for animation
        tipLabel.alpha = 0
        tipControl.alpha = 0
        totalLabel.alpha = 0
        tipTitle.alpha = 0
        youpayTitle.alpha = 0
        personLabel.alpha = 0
        personStepper.alpha = 0
        peepImage.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
    updateUI()
        
            }
    
    func updateUI() {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tipPercentages = [0.15, 0.18, 0.20]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = billAmount * tipPercentage
        let person = personStepper.value
        let total = (billAmount + tip)/person
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Animate in when inputting bill amount
        UIView.animateWithDuration(0.8, animations: {
            self.tipLabel.alpha = 1
            self.tipControl.alpha = 1
            self.totalLabel.alpha = 1
            self.tipTitle.alpha = 1
            self.youpayTitle.alpha = 1
            self.personLabel.alpha = 1
            self.personStepper.alpha = 1
            self.peepImage.alpha = 1
            
        })
    }

    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)

    }
    
}
