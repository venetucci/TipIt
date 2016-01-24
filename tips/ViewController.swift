//
//  ViewController.swift
//  tips
//
//  Created by Michelle Harvey on 1/18/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let goodFaceImage = UIImage(named: "good_face")
    let greatFaceImage = UIImage(named: "great_face")
    let amazingFaceImage = UIImage(named: "amazing_face")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipControl.setImage(goodFaceImage, forSegmentAtIndex: 0)
        tipControl.setImage(greatFaceImage, forSegmentAtIndex: 1)
        tipControl.setImage(amazingFaceImage, forSegmentAtIndex: 2)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip: Double = 0
        var total: Double = 0
        
        if let billAmount = Double(billField.text!) {
            tip = billAmount * tipPercentage
            total = billAmount + tip
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Remove segmented controller borders
    
    
}
