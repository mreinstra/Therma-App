//
//  topic.swift
//  Therma
//
//  Created by Charlie Donnelly on 3/21/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class topic: UIViewController {

    
    var myMeeting = info()
    
    @IBAction func topicField(_ sender: Any) {
        (sender as AnyObject).resignFirstResponder()
        myMeeting.topic = input.text!
        print(myMeeting.topic)
        //print(input.text!)
    }
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is dateAndTime
        {
            let vc = segue.destination as? dateAndTime
            
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
