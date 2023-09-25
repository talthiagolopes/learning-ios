//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        tableView.delegate = self
        tableView.dataSource = self
        
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        
        if let messageBody = messageTextfield.text, let messageSender =  Auth.auth().currentUser?.email {
            db.collection(K.FirebaseStore.collectionName).addDocument(data: [
                K.FirebaseStore.senderField: messageSender,
                K.FirebaseStore.bodyField: messageBody,
                K.FirebaseStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                }
                else {
                    print("Successfully saved data!")
                    
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func loadMessages() {
        
        db.collection(K.FirebaseStore.collectionName)
            .order(by: K.FirebaseStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            if let e = error {
                print("There was an issue saving data to firestore, \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        if let messageSender = data[K.FirebaseStore.senderField] as? String, let messageBody = data[K.FirebaseStore.bodyField] as? String {
                            let message = Message(sender: messageSender, body: messageBody)
                            self.messages.append(message)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
}


//MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.messageLabel?.text = message.body
    
        //Check if a message is from the current user
        if message.sender == Auth.auth().currentUser?.email {
            setMessageConfiguration(cell, letfImageIsHidden: false, rightImageIsHidden: true, backgroundColor: K.BrandColors.lightPurple, textColor: K.BrandColors.purple)
        }
        else {
            setMessageConfiguration(cell, letfImageIsHidden: true, rightImageIsHidden: false, backgroundColor: K.BrandColors.purple, textColor: K.BrandColors.lightPurple)
        }

        return cell
    }
    
    func setMessageConfiguration(_ cell: MessageCell, letfImageIsHidden: Bool, rightImageIsHidden: Bool, backgroundColor: String, textColor: String) {
        
        cell.leftImageView.isHidden =  letfImageIsHidden
        cell.rightImageView.isHidden = rightImageIsHidden
        cell.messageBubble.backgroundColor = UIColor(named: backgroundColor)
        cell.messageLabel.textColor = UIColor(named: textColor)
    }
}


//MARK: - UITableViewDelegate
extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


