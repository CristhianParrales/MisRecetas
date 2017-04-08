//
//  FullRecipeCell.swift
//  MisRecetas
//
//  Created by Cristhian Parrales on 4/3/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
//

import UIKit

class FullRecipeCell: UITableViewCell {

    @IBOutlet weak var fullImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
