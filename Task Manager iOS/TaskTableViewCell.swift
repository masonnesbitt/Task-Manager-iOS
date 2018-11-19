//
//  TaskTableViewCell.swift
//  Task Manager iOS
//
//  Created by Mason Nesbitt on 10/31/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    // these are inside of the cell.
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var comOrIncomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
