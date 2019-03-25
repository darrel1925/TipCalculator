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
    @IBOutlet weak var amonutSpent: UILabel!
    @IBOutlet weak var tipDiscription: UILabel!
    @IBOutlet weak var totalDiscription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "currentOn") == nil {
            
            UserDefaults.standard.setValue("usDollar", forKey: "currentOn")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        calculate()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTIP(_ sender: Any) {
        
        calculate()
        
    }
    
    func calculate() {
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex ]
        let total = bill + tip
        
        if UserDefaults.standard.object(forKey: "currentOn") as! String == "usDollar" {

            tipDiscription.text = "Tip Amount:"
            totalDiscription.text = "Total:"
            amonutSpent.text = "Amount Spent"
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
        
        else if UserDefaults.standard.object(forKey: "currentOn") as! String == "peso" {
            tipDiscription.text = "Gratificación:"
            totalDiscription.text = "Total:"
            amonutSpent.text = "Dinero Gastado"
            
            tipLabel.text = String(format: "Mex$%.2f", tip)
            totalLabel.text = String(format: "Mex$%.2f", total)
        }
        
        else if UserDefaults.standard.object(forKey: "currentOn") as! String == "euro" {
            tipDiscription.text = "Le Pourboire:"
            totalDiscription.text = "Total:"
            amonutSpent.text = "Argent épensé"
            
            tipLabel.text = String(format: "€%.2f", tip)
            totalLabel.text = String(format: "€%.2f", total)
        }

    }
    

}

