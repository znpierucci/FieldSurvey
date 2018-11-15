//
//  TableViewController.swift
//  FieldSurvey
//
//  Created by Zachary Pierucci on 11/14/18.
//  Copyright © 2018 Zachary Pierucci. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var fieldTableView: UITableView!
    
    let jsonFileName = "fieldObservationsList"
    
    let date = Date()
    
    var fieldObservationsArray: [FieldObservations] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fieldSet = FieldObservationsLoader.load(jsonFileName: jsonFileName) {
            for item in fieldSet.observations {
                let newField = FieldObservations(classification: item.classification, title: item.title, description: item.description, date: item.date)
                fieldObservationsArray.append(newField)
            }
        } else {
            print("JSON Loading Error")
        }
        
        fieldTableView.dataSource = self
        fieldTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldObservationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fo = fieldObservationsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        //date management
        let date = fo.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy 'at' HH:mm:ss a"
        let resultingDateString = dateFormatter.string(from: date)
        
        cell.titleLabel?.text = fo.title
        cell.dateLabel?.text = resultingDateString
        switch fo.classification {
        case .bird:
            cell.classificationImage?.image = UIImage(named: "bird")
        case .insect:
            cell.classificationImage?.image = UIImage(named: "insect")
        case .amphibian:
            cell.classificationImage?.image = UIImage(named: "amphibian")
        case .reptile:
            cell.classificationImage?.image = UIImage(named: "reptile")
        case .mammal:
            cell.classificationImage?.image = UIImage(named: "mammal")
        case .fish:
            cell.classificationImage?.image = UIImage(named: "fish")
        case .plant:
            cell.classificationImage?.image = UIImage(named: "plant")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationViewController,
            let row = fieldTableView.indexPathForSelectedRow?.row {
            destination.observation = fieldObservationsArray[row]
        }
    }
}
