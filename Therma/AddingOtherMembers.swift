//
//  AddingOtherMembers.swift
//  Therma
//
//  Created by Charlie Donnelly on 4/23/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit



class AddingOtherMembers: UIViewController {
    
     var myMeeting = info()

    @IBOutlet weak var memberName: UITextField!
    
    @IBAction func topicField(_ sender: Any) {
        (sender as AnyObject).resignFirstResponder()
    }
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func saveAddAnother(_ sender: Any) {
        
        let nameToSave = memberName.text;
        memberName.text = "";
        myMeeting.text_signatures.append(nameToSave!)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Notes
        {
            let vc = segue.destination as? Notes
            
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
