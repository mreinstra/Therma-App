//
//  info.swift
//  Therma
//
//  Created by Meg Reinstra on 3/5/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import Foundation
import UIKit

class info: NSObject
{
    var topic = ""
    var date = ""
    var supervisor = ""
    var site = ""
    var text_signatures = [String]()
    var image_signatures = [UIImage]()
    var notes = ""
    var meetingText = ""
    var photo = UIImage()
    
    func toString()
    {
        print("topic: " + topic)
        print("date: " + date)
        print("supervisor: " + supervisor)
        print("site: " + site)
        print("notes: " + notes)
        print("meetingText: " + meetingText)
        //print("signatures: " + signatures)
    }
}
