//
//  ViewController.swift
//  checklist-app
//
//  Created by Erika Carlson on 9/3/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var checklistItems: [ChecklistItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateChecklistItems()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
        let newRowIndex = checklistItems.count
        
        let newItem = ChecklistItem()
        newItem.name = "I am a new row"
        checklistItems.append(newItem)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        cell.textLabel?.text = checklistItems[indexPath.row].name
        
        let item = checklistItems[indexPath.row]
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = checklistItems[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            swipeToDelete(indexPath: indexPath)
        }
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        checklistItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    func populateChecklistItems() {
        let tasks = ["Walk the dog", "Build an iOS app", "Get some sleep", "Eat delicious food", "Go for a run"]
        
        for task in tasks {
            let item = ChecklistItem()
            item.name = task
            checklistItems.append(item)
        }
    }
}

