//
//  Configuration.swift
//  OCR
//
//  Created by Nazia Afroz on 22/4/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit

import RealmSwift
class Configuration: Object {
    @objc dynamic var id: String = UUID.init().uuidString
    @objc dynamic var key: String = ""
    @objc dynamic var value: String = ""
    @objc dynamic var date: NSDate = NSDate()

    override static func primaryKey() -> String? {
        return "id"
    }
}
