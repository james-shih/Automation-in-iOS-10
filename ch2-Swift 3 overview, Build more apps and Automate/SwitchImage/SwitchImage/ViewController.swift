//
//  ViewController.swift
//  SwitchImage
//
//  Created by jamesshih on 2017/4/17.
//  Copyright © 2017年 i-link. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label_switch: UILabel!
    @IBOutlet weak var switch_state: UISwitch!
    @IBOutlet weak var default_label: UILabel!
    @IBOutlet weak var display_image: UIImageView!
    
    @IBAction func toggleSwitch(_ sender: Any) {
        
        if switch_state.isOn == true {
            label_switch.text = "Switch ON"
            display_image.isHidden = false
            default_label.text = ""
        } else {
            label_switch.text = "Switch OFF"
            display_image.isHidden = true
            default_label.text = "Toggle Switch On To View An Image..."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

