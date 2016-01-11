//
//  SettingsViewController.swift
//  tip
//
//  Created by Dan Tsui on 1/11/16.
//  Copyright © 2016 Dan Tsui. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipSettingControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("tipPercentage")
        tipSettingControl.selectedSegmentIndex = defaultTip
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBack(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let newDefaultTip = tipSettingControl.selectedSegmentIndex
        defaults.setInteger(newDefaultTip, forKey: "tipPercentage")
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }
}
