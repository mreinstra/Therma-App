//
//  ConfirmationPage.swift
//  Therma
//
//  Created by Meg Reinstra on 4/9/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class ConfirmationPage: UIViewController {
    
    var myMeeting = info()
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topic = myMeeting.topic
        let date = myMeeting.date
        let site = myMeeting.site
        let supervisor = myMeeting.supervisor
        
//        print("confirmation page")
//        print(myMeeting.topic)
//        print(myMeeting.date)
//        print(myMeeting.site)
//        print(myMeeting.supervisor)

        // Do any additional setup after loading the view.
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
