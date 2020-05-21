//
//  UIViewControllerEXT.swift
//  GoalPost
//
//  Created by saibalaji on 20/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import UIKit

extension UIViewController
{
    func presentDetail(viewcontroller: UIViewController)
    {
        
        let transition = CATransition()
       // transition.duration = 0.1
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        self.view.window?.layer.add(transition,forKey: kCATransition)
        
        present(viewcontroller, animated: false, completion: nil)
        
    }
    
    func dissmissDetail()
    {
        let transition = CATransition()
       // transition.duration = 0.1
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        
        self.view.window?.layer.add(transition,forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
        
        
        
    }
    
    
    
}
