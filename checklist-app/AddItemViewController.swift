//
//  AddItemViewController.swift
//  checklist-app
//
//  Created by Erika Carlson on 9/3/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController {

    @IBOutlet weak var itemText: UITextField!
    var delegate: AddItemViewControllerDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}


