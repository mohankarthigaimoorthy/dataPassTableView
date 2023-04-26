//
//  animateViewController.swift
//  dataPassTableView
//
//  Created by Mohan K on 09/02/23.
//


struct Message {
    var text : String?
    var sender : Bool?
}

import UIKit

class animateViewController: UIViewController {
    
    @IBOutlet weak var animateTableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    
    var message = [Message]()
    var animateCell : Bool = false
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        message.append(Message(text: "animateTableView.delegate self", sender: false))
        message.append(Message(text: "animateTableView.dataSource self", sender: false))
        message.append(Message(text: "animateTableView.delegate self", sender: false))
        message.append(Message(text: "animateTableView.dataSource self", sender: false))
        message.append(Message(text: "animateTableView.dataSource self", sender: false))
        message.append(Message(text: "animateTableView.delegate self", sender: false))
        
        animateTableView.delegate = self
        animateTableView.dataSource = self
        
        tableReload(animate: false)
        
    }
    
    func tableReload(animate:Bool, data:Message? = Message()) {
        if animate == true {
            animateCell = true
            UIView.animate(withDuration: 0.3) {
                guard let data = data else {return}
                self.message.append(data)
                DispatchQueue.main.async {
                    self.animateTableView.reloadData()
                }
            }
        } else {
            animateCell = false
            UIView.animate(withDuration: 0.3) {
                DispatchQueue.main.async {
                    self.animateTableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        text = messageField.text ?? ""
        tableReload(animate: true, data: Message(text: text, sender: true))
        messageField.text = ""
    }
    
}

extension animateViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageTableCell", for: indexPath) as! messageTableCell
        cell.setData(inputData: message[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if animateCell == true && indexPath.row == message.lastIndex(where: {$0.text == text}) {
            animateTableView.animateCells(AnimationFactory.makeMoveUpWithFade(rowHeight: 60, duration: 0.3, delayFactor: 0.01), tableView: animateTableView, cell: cell, indexPath: indexPath) // (rowHeight: 60, duration: 1, delayFactor: 0.01)
        }
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if animateCell == true && indexPath.row == message.lastIndex(where: {$0.text == text}) {
//            cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            UIView.animate(withDuration: 0.3) {
//                cell.transform = CGAffineTransform.identity
//            }
//        }
//    }
    
}
