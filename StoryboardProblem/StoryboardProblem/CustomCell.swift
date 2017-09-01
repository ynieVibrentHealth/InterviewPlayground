//
//  CustomCell.swift
//  StoryboardProblem
//
//  Created by Yuchen Nie on 8/31/17.
//  Copyright © 2017 Yuchen Nie. All rights reserved.
//

import Foundation
import UIKit

class CustomCell:UITableViewCell {
    let imgURL = URL(string: "http://lorempixel.com/400/400/")
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var buttonLabel: UILabel!
    
    public func configure(text:String) {
        mainLabel.text = text
        buttonLabel.text = "button"
    }
    
}
