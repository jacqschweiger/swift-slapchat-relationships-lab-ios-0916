//
//  RecipientTableViewController.swift
//  SlapChat
//
//  Created by Jacqueline Minneman on 11/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
import UIKit

class RecipientTableViewController: UITableViewController {
    
    
    var store = DataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchRecipData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        store.fetchRecipData()
        tableView.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.recipients.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = store.recipients[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! MessagesTableViewController
        guard let indexPath = self.tableView.indexPathForSelectedRow?.row else{ return }
        
        dest.recipient = store.recipients[indexPath]
        print("////////////recipientVC recipient: \(store.recipients[indexPath])")
    }
    
    
    
}
