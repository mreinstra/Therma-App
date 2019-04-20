//
//  pdfViewer.swift
//  WebDemo
//
//  Created by Cesar Cesarotti on 4/9/19.
//  Copyright © 2019 Cesar Cesarotti. All rights reserved.
//
import UIKit

class pdfViewer: UIViewController {
    
    @IBOutlet weak var linkTextView: UITextView!
    
    @IBOutlet weak var nameLabel: UILabel!
    var link:String?
    var dataTask: URLSessionDataTask?
    var name:String = ""
    var meetingString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        
        
        if let gotURL = link
        {
            getPage(url: gotURL)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helper Functions
    
    func parse(data: String) -> String {
        /* This example uses regular expressions, if you'd prefer
         something a bit more like BeautifulSoup, someone has
         made SwiftSoup, check it out here:
         https://github.com/scinfu/SwiftSoup
         */
        
        var myList = [String]()
        do
        {
            //  <script> window.location = 'http://safety.therma.com/wp-content/uploads/sites/2/2019/03/PPE-FOR-HAZARDOUS-CHEMICALS.txt'; </script>
            let regex = try NSRegularExpression(pattern: "<script> window.location = \'http://(.*?)\'; </script>", options: NSRegularExpression.Options.caseInsensitive)
            
            // More about using NSRegularExpression can be found here:
            //    https://developer.apple.com/documentation/foundation/nsregularexpression
            
            let matches = regex.matches(in: data, options: [], range: NSRange(location: 0, length: data.utf16.count))
            
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
        return myList[0]
    }
    
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Whoops...", message: "There was an error accessing the internet. Please try again.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func getPage(url : String) {
        let myURL = URL(string: url)
        print(myURL)
        var myRequest = URLRequest(url: myURL!)
        // To use the post method or customize the headers, look at the URLRequest documentation: https://developer.apple.com/documentation/foundation/urlrequest
        // Some examples:
        //    myRequest.httpMethod = "POST"
        //    myRequest.addValue(value: "application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        dataTask = session.dataTask(with: myRequest, completionHandler:
            { data, response, error in
                if let error = error as NSError?, error.code == -999
                {
                    return
                }
                else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
                {
                    if let myhtml = String(data: data!, encoding: .utf8)
                    {
                        let newLink = self.parse(data: myhtml)
                        //print(newLink)
                        self.getFinalPage(url: "https://" + newLink)
                    }
                    else{
                        print("no string data!")
                    }
                    return
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
    
    func getFinalPage(url : String) {
        let myURL = URL(string: url)
        var myRequest = URLRequest(url: myURL!)
        // To use the post method or customize the headers, look at the URLRequest documentation: https://developer.apple.com/documentation/foundation/urlrequest
        // Some examples:
        //    myRequest.httpMethod = "POST"
        //    myRequest.addValue(value: "application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        dataTask = session.dataTask(with: myRequest, completionHandler:
            { data, response, error in
                if let error = error as NSError?, error.code == -999
                {
                    return
                }
                else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
                {
                    //print(httpResponse)
                    if let myhtml = String(data: data!, encoding: .ascii)
                    {
                        DispatchQueue.main.async
                            {
                                self.linkTextView.text = myhtml
                        }
                        self.meetingString = myhtml
                    }
                    else{
                        print("no string data!")
                        
                    }
                    return
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is topic
        {
            let vc = segue.destination as? topic
            
            vc?.name = name
            vc?.meetingString = meetingString
        }
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
