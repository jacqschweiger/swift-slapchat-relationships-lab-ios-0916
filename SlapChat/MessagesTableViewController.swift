//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
import UIKit

class MessagesTableViewController: UITableViewController {
    
    var store = DataStore.sharedInstance
    
    var recipient: Recipient!
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.messageArray = recipient.messages?.allObjects as! [Message]
        print("///// messageVC \(recipient.name)")

        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.messageArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        let eachMessage = self.messageArray[indexPath.row]
        
        cell.textLabel?.text = eachMessage.content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddMessage" {
        let dest = segue.destination as! AddMessageViewController
        dest.recipient = self.recipient
        print("/////////////messageVC recipient: \(self.recipient)")
        }
    }
    
    
    
}
