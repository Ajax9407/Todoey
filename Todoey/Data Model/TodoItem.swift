//
//  TodoeyItem.swift
//  Todoey
//
//  Created by Tanmay Pradhan on 31/01/19.
//  Copyright © 2019 Tanmay Pradhan. All rights reserved.
//

import Foundation

class TodoItem {
    var title  : String;
    var done : Bool = false;
    
    init(title : String) {
        self.title = title;
    }
}
