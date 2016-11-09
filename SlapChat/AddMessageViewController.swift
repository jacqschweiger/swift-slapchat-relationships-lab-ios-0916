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

    @IBOutlet weak var addMessageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveMessageButtonTapped(_ sender: AnyObject) {
        let store = DataStore.sharedInstance
        let context = store.persistentContainer.viewContext
        let newMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        newMessage.content = addMessageTextField.text
        newMessage.createdAt = NSDate()
        store.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

