//
//  DBManagaer.swift
//  OCR
//
//  Created by Nazia Afroz on 21/4/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager {

    private var database: Realm
    static let sharedInstance = DBManager()
    private init(){
        database = try! Realm()
    }
    
    //insert/create
    func addTextContent(object: TextContent){
        try! database.write {
//            object.id = object.IncrementaID()
            object.date = NSDate()
            database.add(object, update: true)
            print("Content added successfully")
        }
    }
    
    //read
    func getContentFromDb() -> Results<TextContent> {
        let results: Results<TextContent> = database.objects(TextContent.self)
        return results
    }
    
    //Delete
    func deleteFromDb(object: TextContent)   {
        try!   database.write {
            database.delete(object)
        }
    }
    
//    func contentId() -> Int?{
//        return database.objects(TextContent.self).sorted(byKeyPath: "id").first?.id
//    }
    //MARK:: Configuration table
    func getConfigurationFromDb() -> Results<Configuration>{
        let results: Results<Configuration> = database.objects(Configuration.self)
        return results
    }
    
    func addConfig(object: Configuration){
        try! database.write {
            database.add(object, update: true)
            print("Configuration added successfully")
        }
    }
    
    func getInformation() -> String?{
        let results: Results<Configuration> = database.objects(Configuration.self).filter("key == 'info'")
        let info = (results[0] as Configuration).value
        return info
    }
    
}
