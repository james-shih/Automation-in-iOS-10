//
//  SecondViewController.swift
//  GroceryList
//
//  Created by Alpa Sanghavi on 12/22/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController ,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource{

    
    var item_info = [String]()

    @IBOutlet weak var item_name: UITextField!
    
    @IBOutlet weak var quantity: UITextField!
    
    @IBOutlet weak var add_me: UIButton!
    
    
    @IBOutlet weak var item_types_picker:
    UIPickerView!
    
    
    var current_picker_data = "Gallons"
    
    var picker_data : [String] = ["Gallons","Pieces","Bunches","Box","Boxes","Gallon","Bunch","Piece","Pint","Tub","Bar","Pack"]

    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        current_picker_data = picker_data[row]
    }
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return picker_data.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return picker_data[row]
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  

    
    @IBAction func add_me(_ sender: Any) {

        var item_info_temp  = [String]()
        
        let item_info_obj = UserDefaults.standard.object(forKey: "items") as? [String] ?? [String]()
        
        if((item_name.text?.isEmpty)! || (quantity.text?.isEmpty)!)
        {
            
            let alert = UIAlertController(title: "Invalid Items", message: "Item name or quantity is missing , please enter a valid item name and quantity...", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        else{
            
            item_info_temp = item_info_obj as NSArray as! [String]
            let item_info_str = item_name.text! + " " + quantity.text!
                + " " + current_picker_data
            
            if(item_info_temp.count > 0)
            {
                item_info = item_info_temp
                
                if(item_info_temp.contains(item_info_str))
                {
                    let alert = UIAlertController(title: "Duplicate Items", message: "Item with same name and quantity exists ,click Continue to add and Cancel to skip...", preferredStyle: UIAlertControllerStyle.alert)
                    
                    
                    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {
                        (action: UIAlertAction!) in
                        
                        print("Handling Continue... adding item")
                        
                        self.item_info.append(item_info_str)
                        print(self.item_info)
                        UserDefaults.standard.set(self.item_info, forKey: "items")
                        
                        self.item_name.text? = ""
                        self.quantity.text? = ""
                        
                    }))
                    
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                        
                        self.item_name.text? = ""
                        self.quantity.text? = ""
                        
                        print("Item not added")
                    }))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                    
                    item_info.append(item_info_str)
                    print(item_info)
                    UserDefaults.standard.set(item_info, forKey: "items")
                    
                    item_name.text? = ""
                    quantity.text? = ""
                    
                }
                
            }
                
            else{
                item_info.append(item_info_str)
                print(item_info)
                UserDefaults.standard.set(item_info, forKey: "items")
                item_name.text? = ""
                quantity.text? = ""
                
                
            }
        }
        
        
        
        
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

