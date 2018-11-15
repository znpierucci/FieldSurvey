//
//  ObservationViewController.swift
//  FieldSurvey
//
//  Created by Zachary Pierucci on 11/14/18.
//  Copyright © 2018 Zachary Pierucci. All rights reserved.
//

import UIKit

class ObservationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionField: UITextView!
    
    var observation: FieldObservations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backupDate = Date()
        
        let date = observation?.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy 'at' HH:mm:ss a"
        let resultingDateString = dateFormatter.string(from: date ?? backupDate)
        
        switch observation?.classification {
        case .bird?:
            imageView.image = UIImage(named: "bird")
        case .insect?:
            imageView.image = UIImage(named: "insect")
        case .amphibian?:
            imageView.image = UIImage(named: "amphibian")
        case .reptile?:
            imageView.image = UIImage(named: "reptile")
        case .mammal?:
            imageView.image = UIImage(named: "mammal")
        case .fish?:
            imageView.image = UIImage(named: "fish")
        case .plant?:
            imageView.image = UIImage(named: "plant")
        default:
            print("Error!")
        }
        titleLabel.text = observation?.title
        dateLabel.text = resultingDateString
        descriptionField.text = observation?.description

        // Do any additional setup after loading the view.
    }
}
