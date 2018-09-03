//
//  ChecklistItem.swift
//  checklist-app
//
//  Created by Erika Carlson on 9/3/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import Foundation

struct ChecklistItem {
    
    var name: String
    var checked: Bool
    
    mutating func toggleChecked() {
        checked = !checked
    }
}
