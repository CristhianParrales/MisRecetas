//
//  Recipe.swift
//  MisRecetas
//
//  Created by Cristhian Parrales on 4/3/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
// Mi receta favorita es el encebollado

import Foundation
import UIKit

class Recipe: NSObject {
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    var rating : String = "rating"
    
  //  var isFavourite: Bool = false

    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }

}
