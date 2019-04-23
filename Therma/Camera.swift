//
//  Camera.swift
//  Therma
//
//  Created by Meg Reinstra on 4/19/19.
//  Copyright © 2019 Meg Reinstra. All rights reserved.
//

import UIKit

class Camera: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var myMeeting = info()
    
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet weak var takePhoto: UIButton!
    
    var imagePicker: UIImagePickerController!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        //myMeeting.photo = info[.originalImage] as? UIImage
        //imageView.image = info[.originalImage] as? UIImage
        myMeeting.photo = (info[.originalImage] as? UIImage)!
        imageView.image = myMeeting.photo
    }
    
    @IBAction func photos()
    {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
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
