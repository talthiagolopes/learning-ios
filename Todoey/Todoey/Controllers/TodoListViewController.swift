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
    
    //let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print(dataFilePath!)
        // print data file path Users/tal/Library/Developer/CoreSimulator/Devices/981EBC5B-17B5-41A2-BAD0-7E5EAE57F153/data/Containers/Data/Application/3E4F3A8E-7A2E-4754-8E37-4324D0A2AD8E/Documents/Items.plist
        
        let bla = Item(title: "bla", selected: false)
        let ble = Item(title: "ble", selected: false)
        let bli = Item(title: "bli", selected: false)
        
        array.append(bla)
        array.append(ble)
        array.append(bli)
        
//        if let userDefaultsItems = self.defaults.array(forKey: self.TodoListArrayKey) as? [Item] {
//            self.array = userDefaultsItems;
//        }
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
        
        saveItems()
        
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
            
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            print("It's gonna be trigger on Add Item button click")
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Save items
    fileprivate func saveItems() {
        //self.defaults.set(self.array, forKey: self.TodoListArrayKey)
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(array)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding data array \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    
    
}

