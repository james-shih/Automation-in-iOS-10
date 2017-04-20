//
//  ViewController.swift
//  RegisterMe
//
//  Created by jamesshih on 2017/4/18.
//  Copyright © 2017年 i-link. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField_name: UITextField!
    @IBOutlet weak var textField_email: UITextField!
    @IBOutlet weak var default_label: UILabel!
    @IBOutlet weak var webview_info: UIWebView!
    
    var update_email = [String]()
    
    @IBAction func onSubmit(_ sender: Any) {
        
        if ((textField_name.text?.isEmpty)! && (textField_email.text?.isEmpty)!) {
            default_label.text = "Please enter a valid name and email address"
            default_label.textColor = UIColor.red
        } else {
            if(textField_name.text?.isEmpty)! {
                default_label.text = "Please enter a valid name"
                default_label.textColor = UIColor.red
            } else {
                
                if(textField_email.text?.isEmpty)! {
                    default_label.text = "Please enter a valid email address"
                    default_label.textColor = UIColor.red
                    
                } else {
                    default_label.text = ""
                }
            }
        }
        
        if(default_label.text?.isEmpty)!{
            
            var email_info = [String] ()
            let obj_from_defaults = UserDefaults.standard.object(forKey: "email") as? [String] ?? [String]()
            email_info = obj_from_defaults as NSArray as! [String]
            
            if(email_info.contains(textField_email.text!)) {
                
                let weburl : NSURL = NSURL(string: "http://localhost/failure.html")!
                let webRequest = NSURLRequest(url:weburl as URL)
                webview_info.loadRequest(webRequest as URLRequest)
            } else {
                update_email.append(textField_email.text!)
                UserDefaults.standard.set(update_email, forKey: "email")
                
                let weburl : NSURL = NSURL(string: "http://localhost/welcome.html")!
                let webRequest = NSURLRequest(url : weburl as URL)
                webview_info.loadRequest(webRequest as URLRequest)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}













