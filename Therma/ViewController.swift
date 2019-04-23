//
//  ViewController.swift
//  Therma
//
//  Created by Meg Reinstra on 2/26/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = "04-22-2019 19:30 Plea"
        
        let mySubstring = str.prefix(16) // Hello
        print(mySubstring)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue)
    {
        
    }


}

