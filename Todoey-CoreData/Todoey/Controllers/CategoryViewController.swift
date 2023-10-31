//
//  CategoryViewController.swift
//  Todoey-CoreData
//
//  Created by Thiago Américo Lopes on 31/10/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadCategories()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let  category = categories[indexPath.row]
        
        cell.textLabel?.text = category.name
        
//        cell.accessoryType = item.selected ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath  = tableView.indexPathForSelectedRow {
            
            let destionationViewController = segue.destination as! TodoListViewController
            destionationViewController.selectedCategory = categories[indexPath.row]
            
        }
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }

    //MARK: - Add new Categories Popup
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey-CoreData Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            print("It's gonna be trigger on Plus button click")
            
            let category = Category(context: self.context)
            category.name = textField.text!
            
            self.categories.append(category)
            
            self.saveCategories()
        }
        
        alert.addTextField { (alertTextField) in
            print("It's gonna be trigger on Add Item button click")
            alertTextField.placeholder = "Create a new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Save categories
    
    fileprivate func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving data from context \(error)")
        }
        
        self.tableView.reloadData()
    }
}
