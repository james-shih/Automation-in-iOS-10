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
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            print(results.map { nsString.substring(with: $0.range)})
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func isNameValid() -> Bool {
        
        var matched = true
        let pattern = "^[a-zA-Z\\s][a-zA-z0-9-_]{1,25}[a-zA-Z0-9}\\s+]$"
        if matches(for: pattern, in: textField_name.text!).isEmpty {
            matched = false
        }
        return matched
    }
    
    func isEmailValid() -> Bool {
        
        var matched = true
//        let pattern = "[a-zA-Z0-9.-_]+@[a-zA-Z0-9]+\\.[a-zA-Z]{1,4}"
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if matches(for: pattern, in: textField_email.text!).isEmpty {
            matched = false
        }
        return matched
    }
    
    func dropNameSpace() {
        
        let text = textField_name.text!
        
        if text.characters.first == " " {
            textField_name.text = String(text.characters.dropFirst())
        }
        if text.characters.last == " " {
            textField_name.text = String(text.characters.dropLast())
        }
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        if ((textField_name.text?.isEmpty)! && (textField_email.text?.isEmpty)!) {
            default_label.text = "Please enter a valid name and email address"
        } else {
            
            if(textField_name.text?.isEmpty)! {
                default_label.text = "Please enter a valid name (code:1)"
            } else {
                
                if isNameValid() {
                    
                    if(textField_email.text?.isEmpty)! {
                        default_label.text = "Please enter a valid email address (code:1)"
                    } else {
                        if isEmailValid() {
                            default_label.text = ""
                            dropNameSpace()
                        } else {
                            default_label.text = "Please enter a valid email address (code:2)"
                        }
                        
                    }
                } else {
                    default_label.text = "Please enter a valid name (code:2)"
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
    

}













