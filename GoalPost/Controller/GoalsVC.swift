//
//  ViewController.swift
//  GoalPost
//
//  Created by saibalaji on 19/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import UIKit
import CoreData



class GoalsVC: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var goalarray:[Goal] = [Goal]()
    
    @IBOutlet weak var tablevView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablevView.delegate = self
        tablevView.dataSource = self
        
        tablevView.isHidden = false
        
       
        
     
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        if goalarray.count >= 1
        {
         
         tablevView.isHidden = false
        tablevView.reloadData()
        }
        else
        {
            tablevView.isHidden = true
        }
    }
 
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let deleteaction = UITableViewRowAction(style:.destructive, title: "DELETE") { (UITableViewRowAction, indexpath) in
            
            self.removeitem(indexpath: indexPath)//REMOVE DATA FROM CORE DATA AND UPDATE IT
            
            self.goalarray.remove(at:indexPath.row)//
            //OR
          //  self.getData()//UPDATE THE  DATASOURCE (goalArray) WITH  NEW UPDATED DATA IN CORE DATA
            
            tableView.deleteRows(at: [indexPath], with: .automatic)//DELETE THE SPECIFIED ROW FORM TABLE WITH ANIMATION
            }
        
        
        let addprogrssaction = UITableViewRowAction(style: .normal, title: "ADD") { (UITableViewRowAction, IndexPath) in
            self.setprogress(indexpath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        
        
        deleteaction.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        addprogrssaction.backgroundColor = #colorLiteral(red: 1, green: 0.4885249507, blue: 0.1162504069, alpha: 1)
        return [deleteaction,addprogrssaction]
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalcell", for: indexPath) as! GoalCell
        
        let goalobj = goalarray[indexPath.row]
        
        cell.configureCell(goalobj: goalobj)
        
        return cell
        
        
    }
    

    @IBAction func addGoalBtnClick(_ sender: Any) {
        
        
        
    }
    
    
    
    func setprogress(indexpath: IndexPath)
    {
        guard let managedcontext = appdelegateInstance?.persistentContainer.viewContext else {
            return
        }
        
        let selectedgoal = goalarray[indexpath.row]
        
        if selectedgoal.goalProgress < selectedgoal.goalCompletionValue
        {
            selectedgoal.goalProgress += 1
        }
        else
        {
            return
        }
        
        do
        {
             try managedcontext.save()
             print("Progrss set")
        }
        
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    
    
    func getData()
    {
        guard let managedcontext = appdelegateInstance?.persistentContainer.viewContext else {
             return
        }
        
        let  fetchrequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do
        {
           goalarray = try managedcontext.fetch(fetchrequest)
           
            
        }
        
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    
    func removeitem(indexpath: IndexPath)
    {
        let managedcontext = appdelegateInstance!.persistentContainer.viewContext
        managedcontext.delete(goalarray[indexpath.row])
        
        do
        {
             try managedcontext.save()
            print("CORE DATA UPDATE SUCCESS")
        }
        
        catch
        {
            print("UNABLE TO UPDATE CORE DATA \(error.localizedDescription)")
        }
        
    }
    
}





