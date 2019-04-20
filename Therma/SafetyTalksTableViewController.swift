//
//  SafetyTalksTableViewController.swift
//  Therma
//
//  Created by Meg Reinstra on 3/5/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit
import WebKit



import UIKit

class SafetyTalksTableViewController: UITableViewController {
    
    var links = [String]()
    var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        links.append(String("Loading..."))
        getLinks()
    }
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Internet Helper Functions
    func parse(data: String) -> [String] {
        /* This example uses regular expressions, if you'd prefer
         something a bit more like BeautifulSoup, someone has
         made SwiftSoup, check it out here:
         https://github.com/scinfu/SwiftSoup
         */
        
        var myList = [String]()
        do
        {
            let regex = try NSRegularExpression(pattern: "<a .*? href=\"(.*?)\">Download", options: NSRegularExpression.Options.caseInsensitive)
            
            // More about using NSRegularExpression can be found here:
            //    https://developer.apple.com/documentation/foundation/nsregularexpression
            
            let matches = regex.matches(in: data, options: [], range: NSRange(location: 0, length: data.utf16.count))
            //print("count:")
            //print(matches.count)
            for match in matches
            {
                let range = match.range(at: 1)
                /* 0 is the whole string that matched the pattern,
                 1+ are capture groups. You can loop through all with:
                 for n in 0..<match.numberOfRanges
                 */
                if let swiftRange = Range(range, in: data)
                {
                    myList.append(String(data[swiftRange]))
                }
            }
        }
        catch
        {
            print("RegEx error!")
        }
        return myList
    }
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Whoops...", message: "There was an error accessing the internet. Please try again.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func getLinks() {
        let myURL = URL(string: String("https://safety.therma.com/category/Toolbox-Meetings-Text-Files/"))
        var myRequest = URLRequest(url: myURL!)
        // To use the post method or customize the headers, look at the URLRequest documentation: https://developer.apple.com/documentation/foundation/urlrequest
        // Some examples:
        //    myRequest.httpMethod = "POST"
        //    myRequest.addValue(value: "application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        dataTask = session.dataTask(with: myRequest, completionHandler:
            { data, response, error in
                if let error = error as NSError?
                {
                    print("An error occured: \(error.localizedDescription)")
                    return
                }
                else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
                {
                    if let myhtml = String(data: data!, encoding: .utf8)
                    {
                        //print(myhtml)
                        self.links = self.parse(data: myhtml)
                        DispatchQueue.main.async
                            {
                                self.tableView.reloadData()
                        }
                        return
                    }
                }
                else
                {
                    print("Failure! \(response!)")
                }
                DispatchQueue.main.async
                    {
                        self.showNetworkError()
                }
        })
        dataTask?.resume()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return links.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pdf", for: indexPath)
        let link = links[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        var workingStr = link.replacingOccurrences(of: "https://safety.therma.com/", with: "")
        workingStr = workingStr.replacingOccurrences(of: "/", with: "")
        workingStr = workingStr.replacingOccurrences(of: "-", with: " ")
        print(workingStr)
        label.text = workingStr
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is pdfViewer
        {
            let vc = segue.destination as? pdfViewer
            
            if let myCell = sender as? UITableViewCell
            {
                let label = myCell.viewWithTag(1000) as! UILabel
                //print("https://safety.therma.com/" + label.text!.replacingOccurrences(of: " ", with: "-") + "/")
                vc?.link = "https://safety.therma.com/" + label.text!.replacingOccurrences(of: " ", with: "-") + "/"
                vc?.name = label.text!
            }
        }
    }
    
    
}





