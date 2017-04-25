//
//  DataViewController.swift
//  Motivational Quotes
//
//  Created by Alpa Sanghavi on 12/22/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    var curr_image : UIImage = UIImage(named:"nature_image23.jpg")!
   
    @IBOutlet weak var label_quotes: UILabel!
    @IBOutlet weak var base_image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.label_quotes!.text = dataObject
        self.base_image.image = curr_image

    }


}

