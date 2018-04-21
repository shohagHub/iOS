//
//  TextContent.swift
//  OCR
//
//  Created by Nazia Afroz on 21/4/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit
import RealmSwift

class TextContent: Object{
    @objc dynamic var id = 0
    @objc dynamic var content: String = ""
    @objc dynamic var date: NSDate = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Incrementa ID
    func IncrementaID() -> Int{
        //        let realm = try! Realm()
        if let retNext = DBManager.sharedInstance.contentId() {
            return retNext + 1
        }else{
            return 1
        }
    }
}
