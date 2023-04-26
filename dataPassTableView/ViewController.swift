//
//  ViewController.swift
//  dataPassTableView
//
//  Created by Mohan K on 08/02/23.
//

import UIKit
protocol passDataBack{
    func updateRow(updatedName:String)
//    func updatedRows(updateName:String)
}
class ViewController: UIViewController {

    @IBOutlet weak var myRowData: UITextField!
    var dataPass:String?
    var delegate:passDataBack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRowData.text = dataPass!
        // Do any additional setup after loading the view.
    }


    @IBAction func updateRow(_ sender: Any) {
        let studentName=myRowData.text!
        delegate.updateRow(updatedName: studentName)
        dismiss(animated: true, completion: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name("Test"), object: self, userInfo: ["name": ["moha","ayarrapan","praveen","karhi","hari","jenin","moha","ayarrapan","praveen","karhi","hari"]])
    }
}

