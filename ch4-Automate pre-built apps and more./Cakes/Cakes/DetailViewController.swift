//
//  DetailViewController.swift
//  Cakes
//
//  Created by Alpa Sanghavi on 12/20/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var cake_name: UILabel!
    
    @IBOutlet weak var cake_image: UIImageView!
    
    @IBOutlet weak var cake_desc: UILabel!
    
    
    var cakes = [Cake]()
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            cake_name?.text = detail.name
            cake_desc?.text = detail.description
            cake_image?.image = detail.cakeImage()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.configureView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: Cake? {
        didSet {
            
            self.navigationItem.leftBarButtonItem?.title = "More Cakes"
            // Update the view.
            self.configureView()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem?.title = "More Cakes"
    }
    
    
    
}

