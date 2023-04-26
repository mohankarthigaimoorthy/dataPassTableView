//
//  thirdVc.swift
//  dataPassTableView
//
//  Created by Mohan K on 08/02/23.
//

import UIKit

protocol getData{
    func updateRows(updatedName:String)
    
}
class thirdVc: UITableViewController,passDataBack {
  
    
let identifier = "cell3"
    
    var students: [String] = ["shivaji", "shiva", "vijay", "ajith", "sandeep", "sudeep", "rangrok", "grunt", "pranav", "iniyanvan"]
    
    var selectedData:String = ""
    var rowNumber: Int=0
    var delegate:getData!
    var dataPass:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(self.NotificationAct(_:)), name: NSNotification.Name(rawValue: "Test"), object: nil)
        
       
    }
    
    @objc func NotificationAct(_ notification: NSNotification) {
        if let userInfo = notification.userInfo {
           if let userName = userInfo["name"] as? String {
                print("name : \(userName)")
//            textLabel?.text = userName
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
        
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        guard let selectedRow = indexPath?.row
        else {return}
        
        let selectedName = students[selectedRow]
        let destinationVc = segue.destination as? ViewController
        destinationVc?.delegate=self
        destinationVc?.dataPass=selectedData
    }
    
    func updateRow(updatedName: String) {
        students[rowNumber]=updatedName
        tableView.reloadData()
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData=students[indexPath.row]
        rowNumber=indexPath.row // 2
//        performSegue(withIdentifier: "mySegue2", sender: self)
    }
}
