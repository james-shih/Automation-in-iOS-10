//
//  ViewController.swift
//  LuckyColor
//
//  Created by jamesshih on 2017/4/14.
//  Copyright © 2017年 i-link. All rights reserved.
//

import UIKit

let appleKey = "Apples"
let orangeKey = "Oranges"
let berryKey = "Berries"
let grapeKey = "Grapes"
let pineappleKey = "Pineapple"

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var label_text: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!

    var picker_data = [appleKey, orangeKey, berryKey, grapeKey, pineappleKey]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker_data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return picker_data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("select item: \(picker_data[row])")
        
        var items_dic = [appleKey : "Your Lucky Color Is Red",
                         orangeKey : "Your Lucky Color Is Orange",
                         berryKey : "Your Lucky Color Is Blue",
                         grapeKey : "Your Lucky Color Is Green",
                         pineappleKey : "Your Lucky Color Is Yellow"]
        
        if(picker_data[row] == appleKey){
            label_text.text = items_dic[appleKey]
            label_text.textColor = UIColor.red
        }
        
        if(picker_data[row] == berryKey){
            label_text.text = items_dic[berryKey]
            label_text.textColor = UIColor.blue
        }
        
        if(picker_data[row] == orangeKey){
            label_text.text = items_dic[orangeKey]
            label_text.textColor = UIColor.orange
        }
        
        if(picker_data[row] == grapeKey){
            label_text.text = items_dic[grapeKey]
            label_text.textColor = UIColor.green
        }
        
        if(picker_data[row] == pineappleKey){
            label_text.text = items_dic[pineappleKey]
            label_text.textColor = UIColor.yellow
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

