//
//  ViewController.swift
//  TipCalculator
//
//  Created by Darrel Muonekwu on 3/23/19.
//  Copyright © 2019 Darrel Muonekwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tipPercentages = [0.15, 0.18, 0.20]
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTIP(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex ]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    

}

