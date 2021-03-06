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
    var trueBody = ""
    var image = UIImage()
    
    @IBAction func doneButton()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveMeeting()
    {
        print("meeting saved!!!")
        let file = "file.txt" //this is the file. we will write to and read from it
        
        var text = myMeeting.date + "\n@@@@@" + myMeeting.toString() + "\n@@@@@" + trueBody //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print("original: " + text2)
                text = text2 + "\n**********\n" + text
            }
            catch {print("trouble reading")}
            
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
                print("new: " + text)
            }
            catch {print("trouble writing")}
            
        }
        print("finished")
    }

    //@IBOutlet weak var imageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topic = myMeeting.topic
        let date = myMeeting.date
        let site = myMeeting.site
        let supervisor = myMeeting.supervisor
        let notes = myMeeting.notes
        let meetingText = myMeeting.meetingText
        let textSignatures = myMeeting.text_signatures
        toSend = String(topic) + " " + String(date) + " " + String(site) + " " + String(supervisor)
        //print(toSend)
        
        subject = String(date) + ", " + String(site) + ", " + String(topic)
        
        //let imageData = getSavedImage(named: "FirstSignature")!.pngData()
        
        
        body = "Supervisor: " + String(supervisor) + "\n" + "Site: " + String(site) + "\n" + "Additional Notes: " + String(notes)
            
        body = body + "\n" + "Attendees:\n" + textSignatures.joined(separator:"\n") + "\n"
        
        body += "Also need signatures and photo" + "\n\n\n\n" + "Meeting Text: " + String(meetingText)
       
        print(body)
        
        trueBody = "Please copy the following text into the subject line: " + subject + "\n\n" + body
        
        //image = getSavedImage(named: "FirstSignature")!
        //myMeeting.image_signatures.append(image)
        
        //imageView.image = myMeeting.photo
        print(myMeeting.text_signatures)
        // Do any additional setup after loading the view.
        
        print(myMeeting.toString())
    }

    
    
    // MARK: - Sharing Data with other Apps
    
    @IBAction func shareMailData()
    {
        
        //let activityViewController =
          //  UIActivityViewController(activityItems: [string, url, image, pdf],
          //applicationActivities: nil)
        
        let string = trueBody
      // let image = myMeeting.image_signatures[0]
        let images = myMeeting.image_signatures
        
        var arr = [Any]()
        arr.append(string)
        arr += images
        //arr.append(images)
        
       // let photo = myMeeting.photo
        
        arr.append(myMeeting.photo)
        
        print(arr.count)
        
        let sharingVC =
            UIActivityViewController(activityItems: arr,
                                     applicationActivities: nil)
        //activityItems.append("hello")
        //print(sharingVC.activityItems)

        
       // let mailData = MailObject(subjectLine: subject, messageBody: trueBody, attachment: image)
        
        //let sharingVC = UIActivityViewController(activityItems: [mailData], applicationActivities: nil)
        
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
    
//    var imagePicker: UIImagePickerController!
//
//
//
//    @IBAction func takePhoto(_ sender: Any) {
//        imagePicker =  UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .camera
//
//        present(imagePicker, animated: true, completion: nil)
//    }
//
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        //myMeeting.photo = info[.originalImage] as? UIImage
//        //imageView.image = info[.originalImage] as? UIImage
//        myMeeting.photo = (info[.originalImage] as? UIImage)!
//        imageView.image = myMeeting.photo
//    }
//
}
