//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var array = [Item]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        loadItems()
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
            
            let item = Item(context: self.context)
            item.title = textField.text!
            item.selected = false
            
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
        do {
            try context.save()
        } catch {
            print("Error saving data from context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {

        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            array = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }

}

