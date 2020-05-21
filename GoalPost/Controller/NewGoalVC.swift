//
//  NewGoalVC.swift
//  GoalPost
//
//  Created by saibalaji on 20/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import UIKit

class NewGoalVC: UIViewController {

    var goaltype:String!
    
    @IBOutlet weak var shorttermbtn: UIButton!
    
    @IBOutlet weak var longtermbtn: UIButton!
    
    @IBOutlet weak var goaldescriptionarea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        
        btn.setTitle("OK", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        btn.addTarget(self, action: #selector(nextclick), for: .touchUpInside)
        
        goaldescriptionarea.inputAccessoryView = btn
        
        
    }
    
    
    @objc func nextclick()
    {
        print("Hi")
        view.endEditing(true)
    }
    
    @IBAction func longtermbtnclicked(_ sender: Any) {
        
        longtermbtn.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.04486640304, alpha: 1)
        shorttermbtn.isEnabled = false
        shorttermbtn.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        goaltype = "Long Term Goal"
        performSegue(withIdentifier: "countvcsegue", sender: self)
    }
    
    
    
    
    @IBAction func shorttermbtnclicked(_ sender: Any) {
       
        shorttermbtn.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.04486640304, alpha: 1)
        longtermbtn.isEnabled = false
        longtermbtn.backgroundColor = #colorLiteral(red: 1, green: 0.2552492111, blue: 0.1117798947, alpha: 1)
        goaltype = "Short Term Goal"
         performSegue(withIdentifier: "countvcsegue", sender: self)
    
    }
    
    @IBAction func backbtnpressed(_ sender: Any) {
        
        dismiss(animated:true, completion: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destVC = segue.destination as? goalCountVC
        {
            destVC.goalType = goaltype
            destVC.goalDesc = goaldescriptionarea.text
        }
        
    }
    
}
