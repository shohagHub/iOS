//
//  InformationViewController.swift
//  OCR
//
//  Created by Nazia Afroz on 22/4/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
//        self.initDB()
        self.getDataAndSet()
        self.title = "Information"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initUI(){
        self.infoLabel.sizeToFit()
        self.view.layoutSubviews()
    }
    

    func initDB(){
        let config = Configuration()
        config.key = "info"
        config.value = "This application is for \n extracting character from images"
        DBManager.sharedInstance.addConfig(object: config)
    }
    
    func getDataAndSet(){
        let value = DBManager.sharedInstance.getInformation()
        infoLabel.text = value
    }

}
