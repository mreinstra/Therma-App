//
//  site.swift
//  Therma
//
//  Created by Meg Reinstra on 3/28/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class site: UIViewController {
    
    
    var myMeeting = info()
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func topicField(_ sender: Any) {
        (sender as AnyObject).resignFirstResponder()
        myMeeting.site = input.text!
        print(myMeeting.site)
    }
    
    @IBAction func shareData()
    {
        myMeeting.site = input.text!
    }

    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("site")
        //print(myMeeting.topic)
        //print(myMeeting.date)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SignaturePage
        {
            let vc = segue.destination as? SignaturePage
            
            vc?.myMeeting = myMeeting
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
