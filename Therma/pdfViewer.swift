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
    
    @IBOutlet weak var viewer: WKWebView!
    
    var name:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let link = getLink(name: name)
       
        viewer.load(NSURLRequest(url: NSURL(string: link)! as URL) as URLRequest)


        nameLabel.text = name
        print(name)
        
    }
    
    func getLink(name:String) -> String
    {
        let start = "https://safety.therma.com/wp-content/uploads/sites/2/2019/03/"
        let end = ".txt"
        let newName = name.replacingOccurrences(of: " ", with: "-")
        
        let link = start + newName + end
        print(link)
        
        return(link)
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
