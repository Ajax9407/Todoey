//
//  ViewController.swift
//  Todoey
//
//  Created by Tanmay Pradhan on 29/01/19.
//  Copyright © 2019 Tanmay Pradhan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    //var itemArray = ["Buy eggs","Buy milk","Buy chicken"];
    var itemArray = [TodoItem]();
    //Data storage function
    let defaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let item1 = TodoItem.init(title: "Buy eggs");
        let item2 = TodoItem.init(title: "Buy milk");
        let item3 = TodoItem.init(title: "Buy chicken");
        let item4 = TodoItem.init(title: "Buy bread");
        let item5 = TodoItem.init(title: "Buy butter");
        
        itemArray.append(item1);
        itemArray.append(item2);
        itemArray.append(item3);
        itemArray.append(item4);
        itemArray.append(item5);
        
        if let items = defaults.array(forKey: "itemArray") as? [TodoItem] {
            itemArray = items;
        }
    }
    
    override func didReceiveMemoryWarning() {
        print("ReceivedMemoryWarning");
    }


    //MARK - TableView datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath);
        
        cell.textLabel?.text = itemArray[indexPath.row].title;
        
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none;
        
//        if itemArray[indexPath.row].done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        tableView.reloadData();
        return cell;
    }
    
    //MARK - TableView delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row]);
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done;
        
        tableView.cellForRow(at: indexPath)?.accessoryType = tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ? .none : .checkmark;
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .none;
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark;
//        }
        
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    //MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var alertTextField = UITextField();
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert);
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            //print("Item add handle here");
            if alertTextField.text != nil {
                self.itemArray.append(TodoItem.init(title: alertTextField.text!));
                self.defaults.set(self.itemArray, forKey: "itemArray");
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

