//
//  FirstViewController.swift
//  GroceryList
//
//  Created by Alpa Sanghavi on 12/22/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var Items = [String]()

    @IBOutlet weak var table_list: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        var item_info_temp  = [String]()
        
        let item_info_obj = UserDefaults.standard.object(forKey: "items") as? [String] ?? [String]()
        
        
        item_info_temp = item_info_obj as NSArray as! [String]
        
        Items = item_info_temp
        print(Items.count)
        table_list.reloadData()
    }
    
    
    
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return Items.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        
        
        cell.textLabel?.text = Items[indexPath.row]
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            Items.remove(at: indexPath.row)
            table_list.reloadData()
            UserDefaults.standard.set(Items, forKey: "items")
            
        }
    }

    

}

