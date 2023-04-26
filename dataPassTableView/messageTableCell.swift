//
//  messageTableCell.swift
//  dataPassTableView
//
//  Created by Mohan K on 09/02/23.
//

import UIKit

class messageTableCell: UITableViewCell {
    
    @IBOutlet weak var messageTxtField: UITextField!
    @IBOutlet weak var fieldLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var fieldTrailingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(inputData:Message?) {
        messageTxtField.text = inputData?.text
        
        UIView.animate(withDuration: 0.3) {
            if inputData?.sender == true {
                self.fieldLeadingConstraint.constant = 100
                self.fieldTrailingConstraint.constant = 25
            } else {
                self.fieldTrailingConstraint.constant = 100
                self.fieldLeadingConstraint.constant = 25
            }
        }
    }

}
