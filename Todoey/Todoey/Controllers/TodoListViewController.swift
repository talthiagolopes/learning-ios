//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var array = [Item]()
    
    let TodoListArrayKey = "TodoListArray"
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bla = Item(title: "bla", selected: false)
        let ble = Item(title: "ble", selected: false)
        let bli = Item(title: "bli", selected: false)
        
        array.append(bla)
        array.append(ble)
        array.append(bli)
        
        if let userDefaultsItems = self.defaults.array(forKey: self.TodoListArrayKey) as? [Item] {
            self.array = userDefaultsItems;
        }
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let  item = array[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.selected ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(array[indexPath.row])
        
        array[indexPath.row].selected = !array[indexPath.row].selected
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items Popup
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("It's gonna be trigger on Plus button click")
            
            let item = Item(title: textField.text!, selected: false)
            
            self.array.append(item)
            
            self.defaults.set(self.array, forKey: self.TodoListArrayKey)
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            print("It's gonna be trigger on Add Item button click")
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}

