//
//  SafetyTalksTableViewController.swift
//  Therma
//
//  Created by Meg Reinstra on 3/5/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit
import WebKit



class SafetyTalksTableViewController: UITableViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pdf", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = "fred"
        
        // Configure the cell...
        
        return cell
    }

}




