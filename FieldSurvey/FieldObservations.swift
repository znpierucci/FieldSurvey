//
//  FieldObservations.swift
//  FieldSurvey
//
//  Created by Zachary Pierucci on 11/14/18.
//  Copyright © 2018 Zachary Pierucci. All rights reserved.
//

import Foundation

struct FieldSet: Codable {
    var status: String
    var observations: [FieldObservations]
    
    enum CodingKeys: String, CodingKey {
        case status
        case observations
    }
}

struct FieldObservations: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case classification
        case title
        case description
        case date
    }
    
    enum Classification: String, Codable {
        case bird
        case insect
        case amphibian
        case reptile
        case mammal
        case fish
        case plant
    }
}


