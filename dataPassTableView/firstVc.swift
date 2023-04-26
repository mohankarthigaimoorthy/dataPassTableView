//
//  firstVc.swift
//  dataPassTableView
//
//  Created by Mohan K on 08/02/23.
//

import UIKit

class firstVc: UITableViewController {

    let identifier = "cell1"
    
    
    var students: [String] = ["shivaji", "shiva", "vijay", "ajith", "sandeep", "sudeep", "rangrok", "grunt", "pranav", "iniyanvan"]
    var selectedData:String=""
    var rowNumber:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.NotificationAct(_:)), name: NSNotification.Name(rawValue: "Test"), object: nil)
    }
   
    @objc func NotificationAct(_ notification: NSNotification) {
        if let userInfo = notification.userInfo {
           if let userName = userInfo["name"] as? [String] {
                print("name : \(userName)")
               students=userName
               students.append("mohan")
               tableView.reloadData()
//               textLabel?.text = userName
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        let student = students[indexPath.row]
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
    guard let selectedRow = indexPath?.row
    else{return}
    
    let selectedName = students[selectedRow]
    let destinationVC = segue.destination as? secondVc
//    destinationVC?.delegate=self
//    destinationVC?.dataPass=selectedData
//    destinationVC?.students = selectedRow.self
    }
    func updateRow(updatedName: String) {
        students[rowNumber]=updatedName
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData=students[indexPath.row]
        rowNumber=indexPath.row
    }
}


    

