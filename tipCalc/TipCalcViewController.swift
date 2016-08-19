//
//  ViewController.swift
//  tipCalc
//
//  Created by Thomas Richardson on 8/19/16.
//  Copyright © 2016 Thomas Richardson. All rights reserved.
//

import UIKit

class TipCalcViewController: UIViewController {

    // MARK: - @IBOUTLETS
    
    @IBOutlet weak var tipsyTitleView: UIView!
    @IBOutlet weak var tipsyTitleLabel: UILabel!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var amountEachLabel: UILabel!
    // MARK: - @Properties
    
    var tipCalc = TipCalc(billAmount: 0.0, tipPercent: 0.0)
    var sharersCalc = SplitShare( numberOfSharers: 0.0)
    
    
    // MARK:- Initialize Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        tipPercentValue()
        
    }
    
    // MARK: - @IBActions
    
    @IBAction func billAmountChanges(_ sender: AnyObject) {
        
        calculateTip()
        calculateTotalEach()
    }
    
    @IBAction func tipPercentChanges(_ sender: AnyObject) {
        
        tipPercentValue()
        calculateTip()
        calculateTotalEach()
    }
    @IBAction func splitSlideChanges(_ sender: AnyObject) {
        calculateTotalEach()
    }
    // MARK: - Fucntions
    
    
    func calculateTip()
    {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        
        if let billAmt = billAmountTextField.text
        {
            let billAmount = (billAmt as NSString).doubleValue
            tipCalc.billAmount = billAmount
        }
        
        tipCalc.calculateTip()
        
        updateUI()
    }
    
    func calculateTotalEach()
    {
        sharersCalc.numberOfSharers = Double(splitSlider.value)

        splitValue()
        
        updateUI()

    }
    
   
    func updateUI() {
        
        tipAmountLabel.text = String(format: "$%0.2f", tipCalc.tipAmount)
        totalAmountLabel.text = String(format: "$%0.2f", tipCalc.totalAmount)
        amountEachLabel.text = String(format: "$%0.2f", tipCalc.totalAmount / sharersCalc.numberOfSharers)
    }
    
    func  tipPercentValue()
    {        tipPercentLabel.text = "Tip : \(Int(tipPercentSlider.value * 100))%"

    }
    
    func splitValue()
    {
        splitLabel.text = "Split \(Int(splitSlider.value)) "
    }

    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

