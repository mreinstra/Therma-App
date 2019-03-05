//
//  SafetyTalksTableViewController.swift
//  Therma
//
//  Created by Meg Reinstra on 3/5/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class SafetyTalksTableViewController: UITableViewController{
   
    @IBOutlet weak var label: UIView!
    
    
    var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = "go get Fish and Chips"
        items.append(item1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: - TABLE VIEW DELEGATE
    // tableview(numberOfRowsInSecgion: 1)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell( withIdentifier: "pdf", for : indexPath)
        let label = cell.viewWithTag(10) as! UILabel
        let item = items[indexPath.row]
        label.text = item
        //        if item.checked {
        //            cell.accessoryType = .checkmark
        //        } else {
        //            cell.accessoryType = .none
        //
        //        }
        tableView.deselectRow(at: indexPath, animated: true)
        return cell
        
    }
    
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            let item = items[indexPath.row]
            // if cell.accessoryType == .none {
            //    cell.accessoryType = .checkmark
            // } else {
            //  cell.accessoryType = .none
            // }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView( _ tableView: UITableView, commit editingStyle:
        UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        items.remove(at: indexPath.row)
        let  indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    
    
}




