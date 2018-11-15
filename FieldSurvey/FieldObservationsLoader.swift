//
//  FieldObservationsLoader.swift
//  FieldSurvey
//
//  Created by Zachary Pierucci on 11/15/18.
//  Copyright © 2018 Zachary Pierucci. All rights reserved.
//

import Foundation

class FieldObservationsLoader {
    
    class func load(jsonFileName: String) -> FieldSet? {
        var fieldSet: FieldSet?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        //Possible error of not finding correct json file name below
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            fieldSet = try? jsonDecoder.decode(FieldSet.self, from: jsonData)
        }
        
        return fieldSet
    }
}

