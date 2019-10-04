//
//  Cake.swift
//  Cake List
//
//  Created by Stu on 01/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import UIKit

class Cake: Codable {
    
    var title: String
    var desc: String
    var image: String
    
    init(title: String, desc: String, image: String) {
        self.title = title
        self.desc = desc
        self.image = image
    }
    
}
