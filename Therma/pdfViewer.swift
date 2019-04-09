//
//  pdfViewer.swift
//  Therma
//
//  Created by Meg Reinstra on 3/7/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit
import WebKit

class pdfViewer: UIViewController {
    

    
    @IBOutlet weak var nameLabel: UILabel!
    var link:String = "http://safety.therma.com/wp-content/uploads/sites/2/2019/03/GOOD-HOUSEKEEPING.txt"
    var name:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let url = URL(string: "http://safety.therma.com")
        let request = URLRequest(url: url!)
        //pdfView.load(request)
        let pdfURL = URL(string: String(link))
        let myRequest = URLRequest(url: pdfURL!)
        print(myRequest)
        //pdfView.load(myRequest)
        nameLabel.text = name
        print(name)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //pdfView.reload()
    }
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
