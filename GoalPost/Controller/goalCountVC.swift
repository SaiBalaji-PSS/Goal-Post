//
//  goalCountVC.swift
//  GoalPost
//
//  Created by saibalaji on 20/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import UIKit
import CoreData

let appdelegateInstance = UIApplication.shared.delegate as? AppDelegate

class goalCountVC: UIViewController {
    var goalDesc: String!
    var goalType: String!
    @IBOutlet weak var countentry: UITextField!
    @IBOutlet weak var savebtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    print(goalType!)
    print(goalDesc!)
     

    }
    
    
    @IBAction func cancelbtnpressed(_ sender: Any) {
        
        dismiss(animated: true, completion:nil)
        
    }
    
    

    @IBAction func savebtnpressed(_ sender: Any) {
        
        if savedata()
        {
            print("SAVED")
        }
        
        else
        {
            print("Unable to save")
        }
        
        
    }
    

    
    
    func savedata() -> Bool
    {
        guard let managedcontext = appdelegateInstance?.persistentContainer.viewContext else {
            return false
        }
        
        let goaldata = Goal(context:managedcontext)
        
        goaldata.goalType = goalType!
        goaldata.goalDescription = goalDesc!
        goaldata.goalCompletionValue = Int32(countentry.text!) ?? 0
        goaldata.goalProgress = Int32(0)
        
        do
        {
            try managedcontext.save()
            return true
        }
        
        catch
        {
            print("\(error.localizedDescription)")
            return false
        }
        
       
        
        
        
    }
    
}
