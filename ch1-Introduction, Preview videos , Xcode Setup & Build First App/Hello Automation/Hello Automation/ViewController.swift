//
//  ViewController.swift
//  Hello Automation
//
//  Created by jamesshih on 2017/4/13.
//  Copyright © 2017年 i-link. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextField!
    
    @IBAction func ClickMePressed(_ sender: Any) {
        
        
        textLabel.text = infoTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

