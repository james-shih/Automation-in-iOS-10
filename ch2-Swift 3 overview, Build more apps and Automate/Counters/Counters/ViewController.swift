//
//  ViewController.swift
//  Counters
//
//  Created by Alpa Sanghavi on 10/18/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter : Int = 0
    
    @IBOutlet weak var label_text: UILabel!
    
    @IBAction func button_tapMe(_ sender: AnyObject) {
        
        counter += 1
        var updated_label = "Button clicked for :"
        
        updated_label = updated_label + String(counter) + " times"
        label_text.text = updated_label
    }
    
}

