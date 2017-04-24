//
//  Cake.swift
//  testMasterDetail
//
//  Created by Alpa Sanghavi on 12/15/16.
//  Copyright © 2016 Seagate. All rights reserved.
//

import Foundation
import UIKit

enum Cake_type {
    case Choclate, Vanilla, RedVelvet, BlackForest,Strawberry
}

class Cake {
    let name: String
    let description: String
    let cake_type: Cake_type
    
    // designated initializer for a Monster
    init(name: String, description: String, type: Cake_type) {
        self.name = name
        self.description = description
        self.cake_type = type
    }
    
    
    
    // Convenience method for fetching a monster's weapon image
    func cakeImage() -> UIImage? {
        switch self.cake_type {
        case .Choclate:
            return UIImage(named: "choc_cake.jpg")
        case .Vanilla:
            return UIImage(named: "vanilla_cake.jpg")
        case .RedVelvet:
            return UIImage(named: "red_velvet_cake.jpg")
        case .BlackForest:
            return UIImage(named: "black_forest1.jpg")
        case .Strawberry:
            return UIImage(named: "starwberry_cake.jpg")
        }
    }
}
