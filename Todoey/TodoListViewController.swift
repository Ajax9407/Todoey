//
//  ViewController.swift
//  Todoey
//
//  Created by Tanmay Pradhan on 29/01/19.
//  Copyright © 2019 Tanmay Pradhan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Buy eggs","Buy milk","Buy chicken"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    //MARK - TableView datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath);
        
        cell.textLabel?.text = itemArray[indexPath.row];
        return cell;
    }
    
    //MARK - TableView delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row]);
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none;
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark;
        }
        
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    //MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var alertTextField = UITextField();
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert);
        
        let addAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //print("Item add handle here");
            if alertTextField.text != nil {
                self.itemArray.append(alertTextField.text!);
                self.tableView.reloadData();
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);
        alert.addAction(addAction);
        alert.addAction(cancelAction);
        
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Type item here";
            alertTextField = UITextField;
        }
        
        present(alert, animated: true, completion: nil);
        
    }
    
}

