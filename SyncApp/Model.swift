//
//  Model.swift
//  SyncApp
//
//  Created by Jing Si on 4/19/17.
//  Copyright © 2017 Jing Si. All rights reserved.
//

import UIKit

class Model: NSObject {
    var interval: String!
    var hours: String!
    var minutes: String!
    var trigger: Bool!
    
    override init() {
        self.hours = "0"
        self.minutes = "1"
        self.trigger = true
    }
}
