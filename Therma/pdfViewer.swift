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
    

    @IBOutlet weak var pdfView: WKWebView!
    
    var link:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        let url = URL(string: "http://safety.therma.com")
//        let request = URLRequest(url: url!)
//        pdfView.load(request)
        let pdfURL = URL(string: String(link))
        let myRequest = URLRequest(url: pdfURL!)
        pdfView.load(myRequest)
        print(link)
        
        let matched = matches(for: "(?<=19-)(.*)(?=-No)", in: link)
        print(matched)
        //this does all the dashes.
        var dash:String = matched[0]
        let matchedNoDash = matches(for: "[^-]*", in: String(dash))
        print(matchedNoDash)
        let title = matchedNoDash.joined(separator: " ")
        print(title)
        //[^=]*
       // print(matchedNoDash)
        // also get the date
        // ["https://safety.therma.com/wp", "", "content/uploads/sites/2/2019/02/03", "", "25", "", "19", "", "Temporary", "", "Heating", "", "Devices", "", "No", "", "12.pdf", ""]
        // Filter out all the empty springs:
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pdfView.reload()
    }
    // Stack overflow code/standard regex in python
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
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
