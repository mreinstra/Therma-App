//
//  pastMeetingsInfoPage.swift
//  Therma
//
//  Created by Meg Reinstra on 4/9/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit
import MessageUI

class pastMeetingsInfoPage: UIViewController {
    
    var name: String = ""
    var subject: String = ""
    var body: String = "test test test"

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
//    func configuredMailComposeViewController() -> MFMailComposeViewController {
//        let mailComposerVC = MFMailComposeViewController()
//        mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
//
//        mailComposerVC.setToRecipients(["charlie.donnelly@menloschool.org"])
//        mailComposerVC.setSubject("About your grade...")
//        mailComposerVC.setMessageBody(String(toSend), isHTML: false)
//
//        return mailComposerVC
//
//    }
    
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
    
    
    // MARK: - Sharing Data with other Apps
    
    @IBAction func shareMailData()
    {
        let image = getSavedImage(named: "FirstSignature")!
        let mailData = MailObject(subjectLine: subject, messageBody: body, attachment: image)
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
