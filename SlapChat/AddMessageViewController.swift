//
//  ViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
import UIKit
import CoreData

class AddMessageViewController: UIViewController {
    
    var recipient: Recipient!
    
    @IBOutlet weak var addMessageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveMessageButtonTapped(_ sender: AnyObject) {
        let store = DataStore.sharedInstance
        let managedContext = store.persistentContainer.viewContext
        
        let message = Message(context: managedContext)
        message.content = addMessageTextField.text
        message.createdAt = NSDate()
       
        recipient.addToMessages(message)
        print("//////////// AddVC \(recipient.name)")
        
        store.saveContext()
       
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
