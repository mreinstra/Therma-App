//
//  dateAndTime.swift
//  Therma
//
//  Created by Meg Reinstra on 3/28/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class dateAndTime: UIViewController {

    
    var myMeeting = info()
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBAction func datePickerAction(_ sender: Any) {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        var strDate = dateFormatter.string(from: myDatePicker.date)
        
        myMeeting.date = strDate
        
        print(myMeeting.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        var strDate = dateFormatter.string(from: myDatePicker.date)
        myMeeting.date = strDate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is site
        {
            let vc = segue.destination as? site
            
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
