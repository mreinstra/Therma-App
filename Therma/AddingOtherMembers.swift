//
//  AddingOtherMembers.swift
//  Therma
//
//  Created by Charlie Donnelly on 4/23/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit



class AddingOtherMembers: UIViewController {
    
    @IBOutlet weak var otherSignatures: UIImageView!
    var myMeeting = info()
    var lastPoint = CGPoint.zero
    var swiped = false

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
        reset()
       // myMeeting.image_signatures.append()
        
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        UIGraphicsBeginImageContext(view.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            otherSignatures.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            
            context.setLineCap(CGLineCap.round)
            context.setLineWidth(5)
            //context.setStrokeColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            context.setStrokeColor(UIColor.black.cgColor)
            
            context.move(to: fromPoint)
            context.addLine(to: toPoint)
            context.drawPath(using: .fillStroke)
            
            otherSignatures.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
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
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        
        if !swiped {
            // draw a single point
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        
    }
    
    @IBAction func reset()
    {
        otherSignatures.image = nil
    }
    
    @IBAction func save()
    {
        // I added this code to try saving to the directory. (See saveImage function below)
        
    myMeeting.image_signatures.append(UIGraphicsGetImageFromCurrentImageContext()!)
        
        UIGraphicsBeginImageContext(view.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            otherSignatures.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            if let myImage = UIGraphicsGetImageFromCurrentImageContext()
            {
                UIImageWriteToSavedPhotosAlbum(myImage, nil, nil, nil)
                // or do something else with the image here.
            }
            // I ADDED THIS LINE:
            saveImage(imageName: "FirstSignature", image: UIGraphicsGetImageFromCurrentImageContext()!)
            UIGraphicsEndImageContext()
        }
    }
    
    
    // Example function to save an image to the app's document directory.
    func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
        
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
