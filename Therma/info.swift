//
//  info.swift
//  Therma
//
//  Created by Meg Reinstra on 3/5/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import Foundation

class info: NSObject
{
    var topic = ""
    var date = ""
    var supervisor = ""
    var site = ""
    var signatures = [String]()
    var notes = ""
    var meetingText = ""
    
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
