//
//  ConfirmationPage.swift
//  Therma
//
//  Created by Meg Reinstra on 4/9/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit
import MessageUI

class ConfirmationPage: UIViewController {
    
    var myMeeting = info()
    var toSend = ""
    var subject = ""
    var body = ""
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveMeeting()
    {
        print("meeting saved!!!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topic = myMeeting.topic
        let date = myMeeting.date
        let site = myMeeting.site
        let supervisor = myMeeting.supervisor
        let notes = myMeeting.notes
        let meetingText = myMeeting.meetingText
        myMeeting.toString()
        toSend = String(topic) + " " + String(date) + " " + String(site) + " " + String(supervisor)
        //print(toSend)
        
        subject = String(date) + ", " + String(site) + ", " + String(topic)
        body = "Supervisor: " + String(supervisor) + "\n" + "Site: " + String(site) + "\n" + "Additional Notes: " + String(notes) + "\n" + "Also need attendees, signatures, photo, and text of safety meeting" + "\n\n" + "Meeting Text: " + String(meetingText)
        print(body)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendEmailButton(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            present(mailComposeViewController, animated: true, completion: nil)
           // self.dismiss(animated: true, completion: nil)
            
        } else {
            showSendMailErrorAlert()
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
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["charlie.donnelly@menloschool.org"])
        mailComposerVC.setSubject("About your grade...")
        mailComposerVC.setMessageBody(String(toSend), isHTML: false)
        
        let imageData: NSData = getSavedImage(named: "FirstSignature")!.pngData()! as NSData
        mailComposerVC.addAttachmentData(imageData as Data, mimeType: "image/png", fileName: "imageName.png")
        print(mailComposerVC)
        
        return mailComposerVC
        
        
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        let  OKaction = UIAlertAction (title: "OK" , style: .default , handler: nil )
        sendMailErrorAlert.addAction(OKaction)
        present(sendMailErrorAlert, animated: true , completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func sendEmailButtonTapped(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    // MARK: - Sharing Data with other Apps
    
    @IBAction func shareMailData()
    {
        
        let mailData = MailObject(subjectLine: subject, messageBody: body)
        let sharingVC = UIActivityViewController(activityItems: [mailData], applicationActivities: nil)
        
        // want to force it to only share with mail apps? Then restrict everything else, thusly:
        sharingVC.excludedActivityTypes = [ UIActivity.ActivityType.addToReadingList,
                                            UIActivity.ActivityType.airDrop,
                                            UIActivity.ActivityType.assignToContact,
                                            UIActivity.ActivityType.copyToPasteboard,
                                            UIActivity.ActivityType.markupAsPDF,
                                            UIActivity.ActivityType.message,
                                            UIActivity.ActivityType.openInIBooks,
                                            UIActivity.ActivityType.postToFacebook,
                                            UIActivity.ActivityType.postToFlickr,
                                            UIActivity.ActivityType.postToTencentWeibo,
                                            UIActivity.ActivityType.postToTwitter,
                                            UIActivity.ActivityType.postToVimeo,
                                            UIActivity.ActivityType.postToWeibo,
                                            UIActivity.ActivityType.print,
                                            UIActivity.ActivityType.saveToCameraRoll ]
        
        present(sharingVC, animated: true)
        
    }

    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
}
