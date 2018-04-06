//
//  OCRViewController.swift
//  OCR
//
//  Created by Nazia Afroz on 28/2/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit
import TesseractOCR
class OCRViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "OCR"
        activityIndicator.isHidden = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.gray
//        self.navigationItem.leftBarButtonItem?.title = "Left"
        //customView = UIImageView.init(image: UIImage.init(named: "info_ic.png"), highlightedImage: nil)
        // Do any additional setup after loading the view.
        let leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "info_ic.png"), style: .plain, target: self, action: #selector(self.infoButtonAction))
        leftBarButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.navigationItem.rightBarButtonItem = leftBarButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    func performImageRecognition(_ image: UIImage){
       
        if let tesseract = G8Tesseract(language: "eng+fra") {
            tesseract.engineMode = .tesseractCubeCombined
            tesseract.pageSegmentationMode = .auto
            tesseract.image = image.g8_blackAndWhite()
            tesseract.recognize()
            print(tesseract.recognizedText)
            textView.text = tesseract.recognizedText
        }
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func openEditior() {
        print("openEditior()")
        guard let image = imageView.image else {
            print("image not set in image view")
            return
        }
        let controller = CropViewController()
        controller.delegate = self
        controller.image = image
        
        
        let navController = UINavigationController(rootViewController: controller)
        present(navController, animated: true, completion: nil)
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
//        print("")
//        if let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage,
//            let scaledImage = selectedPhoto.scaleImage(640){
//            activityIndicator.isHidden = false
//            activityIndicator.startAnimating()
//            dismiss(animated: true, completion: {
//                self.performImageRecognition(scaledImage)
//            })
//        }
        print("didFinishPickingMediaWithInfo")
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            dismiss(animated: true, completion: nil)
            return
        }
        imageView.image = image
        dismiss(animated: true, completion: {
            [unowned self] in
            self.openEditior()
        })
        
    }
    
    //MARK:: Custom Action
    @objc func infoButtonAction() {
        print("infoButtonAction()");
    }
    
}
