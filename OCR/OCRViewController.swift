//
//  OCRViewController.swift
//  OCR
//
//  Created by Nazia Afroz on 28/2/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit

class OCRViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func takePhotoAction(_ sender: UIButton) {
        let imagePickerActionSheet = UIAlertController(title: "Snap/Upload Image",
                                                       message: nil, preferredStyle: .actionSheet)
        // 3
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraButton = UIAlertAction(title: "Take Photo",
                                             style: .default) { (alert) -> Void in
                                                let imagePicker = UIImagePickerController()
                                                imagePicker.delegate = self
                                                imagePicker.sourceType = .camera
                                                self.present(imagePicker, animated: true)
            }
            imagePickerActionSheet.addAction(cameraButton)
        }
        // Insert here
        // 1
        let libraryButton = UIAlertAction(title: "Choose Existing",
                                          style: .default) { (alert) -> Void in
                                            let imagePicker = UIImagePickerController()
                                            imagePicker.delegate = self
                                            imagePicker.sourceType = .photoLibrary
                                            self.present(imagePicker, animated: true)
        }
        imagePickerActionSheet.addAction(libraryButton)
        // 2
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        imagePickerActionSheet.addAction(cancelButton)
        // 3
        present(imagePickerActionSheet, animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("")
        if let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let scaledImage = selectedPhoto.scaleImage(640){
            dismiss(animated: true, completion: {
                
            })
        }
            
        
    }
    
}
