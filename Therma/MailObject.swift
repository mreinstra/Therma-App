//
//  MailObject.swift
//  EmailAndSharingDemo
//
//  Created by Cesar Cesarotti on 4/7/19.
//  Copyright © 2019 Cesar Cesarotti. All rights reserved.
//

import Foundation
import UIKit

// We need to implement UIActivityItemSource so that we can send both a subject and a message body to the mail application. Otherwise, only one piece of data gets sent.

class MailObject: NSObject, UIActivityItemSource
{
    var subject = ""
    var message = ""
    
    init(subjectLine: String, messageBody: String)
    {
        subject = subjectLine
        message = messageBody
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return message
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return message
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController,
                                subjectForActivityType activityType: UIActivity.ActivityType?) -> String
    {
        return subject
    }
    
}
