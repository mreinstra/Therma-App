//
//  site.swift
//  Therma
//
//  Created by Meg Reinstra on 3/28/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class site: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func topicField(_ sender: Any) {
        (sender as AnyObject).resignFirstResponder()
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
