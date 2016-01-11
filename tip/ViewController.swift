//
//  ViewController.swift
//  tip
//
//  Created by Dan Tsui on 1/11/16.
//  Copyright © 2016 Dan Tsui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("tipPercentage")
        tipControl.selectedSegmentIndex = defaultTip
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("tipPercentage")
        tipControl.selectedSegmentIndex = defaultTip
        onEditingChanged(self)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = billField.text! != "" ? Double(billField.text!) : 0.0
        let tipAmount = billAmount! * tipPercentage
        let totalAmount = billAmount! + tipAmount
        
        tipLabel.text = String(format: "$%.2f", arguments: [tipAmount])
        totalLabel.text = String(format: "$%.2f", arguments: [totalAmount])
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
