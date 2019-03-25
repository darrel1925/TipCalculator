//
//  SettingTableViewController.swift
//  TipCalculator
//
//  Created by Darrel Muonekwu on 3/25/19.
//  Copyright © 2019 Darrel Muonekwu. All rights reserved.
//

import UIKit

class SettingTableViewController: UIViewController {
    
    @IBOutlet weak var usDollar: UISwitch!
    @IBOutlet weak var peso: UISwitch!
    @IBOutlet weak var euro: UISwitch!
    
    override func viewDidLoad() {
        
        
        
        if UserDefaults.standard.object(forKey: "currentOn") == nil {
            UserDefaults.standard.setValue(true, forKey: "usDollar")
            UserDefaults.standard.setValue(false, forKey: "peso")
            UserDefaults.standard.setValue(false, forKey: "euro")
            UserDefaults.standard.setValue("usDollar", forKey: "currentOn")
            
        }
        
        let current = UserDefaults.standard.object(forKey: "currentOn") as! String
        print(current)
        if current == "usDollar" {
            usDollar.setOn(true, animated: true)
            usDollar.isOn = true
            peso.isOn = false
            euro.isOn = false
        }
        
        else if current == "peso" {
            peso.setOn(true, animated: true)
            peso.isOn = true
            usDollar.isOn = false
            euro.isOn = false
        }
        
        else if current == "euro" {
            euro.setOn(true, animated: true)
            euro.isOn == true
            usDollar.isOn = false
            peso.isOn = false
            
        }
    }
    
    
    @IBAction func switchChanged(_ sender: Any) {
        if (usDollar.isOn && peso.isOn){
            
            if UserDefaults.standard.object(forKey: "currentOn") as! String == "usDollar" {
                
                usDollar.isOn = false
                UserDefaults.standard.setValue("peso", forKey: "currentOn")
            }
            else {
                
                peso.isOn = false
                UserDefaults.standard.setValue("usDollar", forKey: "currentOn")
            }
        }
            
        else if (usDollar.isOn && euro.isOn) {
            
            if UserDefaults.standard.object(forKey: "currentOn") as! String == "usDollar" {
                
                usDollar.isOn = false
                UserDefaults.standard.setValue("euro", forKey: "currentOn")
            }
            else {
                
                euro.isOn = false
                UserDefaults.standard.setValue("usDollar", forKey: "currentOn")
            }
        }
            
        else if (peso.isOn && euro.isOn) {
            
            if UserDefaults.standard.object(forKey: "currentOn") as! String == "peso" {
                
                peso.isOn = false
                UserDefaults.standard.setValue("euro", forKey: "currentOn")
            }
            else {
                
                euro.isOn = false
                UserDefaults.standard.setValue("peso", forKey: "currentOn")
            }
        }    
    }
    
    
    
    func switchEnabled() -> UISwitch{
        
        if UserDefaults.standard.object(forKey: "usDollar") as! Int == 1 {
            
            return usDollar
        }
            
        else if UserDefaults.standard.object(forKey: "peso") as! Int == 1 {
            
            return peso
        }
            
        else if UserDefaults.standard.object(forKey: "euro") as! Int == 1 {
            
            return euro
        }
        
        print("error")
        return usDollar
    }
    
}
