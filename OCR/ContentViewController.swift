//
//  ContentViewController.swift
//  OCR
//
//  Created by Nazia Afroz on 22/4/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var textContent: UITextView!
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textContent.text = content
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

}
