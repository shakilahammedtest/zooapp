//
//  Category.swift
//  Artable
//
//  Created by Ashraf Ahmed on 29/10/19.
//  Copyright © 2019 Shakil Ahammed. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category {
    var id : String
    var name : String
    var imgUrl : String
    var isActive : Bool = true
    var timeStamp : Timestamp
}
