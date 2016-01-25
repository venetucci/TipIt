//
//  ViewController.swift
//  tips
//
//  Created by Michelle Harvey on 1/18/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var bottomContent: UIView!
    @IBOutlet weak var billTitleStart: UILabel!
    @IBOutlet weak var billTitleEnd: UILabel!
    @IBOutlet weak var dollarLabel: UILabel!
    
    var firstTapHappened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        setInitialPosition()
    }
    
    func setInitialPosition() {
        containerView.transform = CGAffineTransformMakeTranslation(0, 150)
        dollarLabel.transform = CGAffineTransformMakeTranslation(37, 0)
        bottomContent.transform = CGAffineTransformMakeTranslation(0, 10)
        billField.alpha = 0
        bottomContent.alpha = 0
        billTitleEnd.alpha = 0
        billTitleStart.alpha = 1
    }
    
    func animateToMainPosition() {
        
        UIView.animateWithDuration(0.37, animations: {
            self.containerView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.dollarLabel.transform = CGAffineTransformMakeTranslation(0, 0)
            self.billField.alpha = 1
            }, completion: { (value: Bool) in
            self.billField.becomeFirstResponder()
        })
        
    }
    
    func showTipCalculation() {
        
        UIView.animateWithDuration(0.3, animations: {
            self.bottomContent.transform = CGAffineTransformMakeTranslation(0, 0)
            self.bottomContent.alpha = 1
            self.billTitleEnd.alpha = 1
            self.billTitleStart.alpha = 0
        })
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        showTipCalculation()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[ratingControl.rating]
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
        
        if !firstTapHappened {
            firstTapHappened = true
            animateToMainPosition()
        }
    }
    
    // Remove segmented controller borders
    
    
}
