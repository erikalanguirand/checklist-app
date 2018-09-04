//
//  ChecklistItem.swift
//  checklist-app
//
//  Created by Erika Carlson on 9/3/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import Foundation

class ChecklistItem {
    
    var name = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
