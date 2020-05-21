//
//  GoalCell.swift
//  GoalPost
//
//  Created by saibalaji on 19/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var completionView: UIView!
    @IBOutlet weak var goalprogresslbl: UILabel!
    @IBOutlet weak var typelbl: UILabel!
    @IBOutlet weak var goalDescriptionlbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(goalobj: Goal)
    {
        self.goalDescriptionlbl.text = goalobj.goalDescription
        self.typelbl.text = goalobj.goalType
        self.goalprogresslbl.text = String(describing: goalobj.goalProgress)
        if goalobj.goalProgress == goalobj.goalCompletionValue
        {
            completionView.isHidden = false
        }
        
        
        else
        {
            completionView.isHidden = true
        }
        
    }

   

}
