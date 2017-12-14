//
//  PlannerViewController.swift
//  Assignment2
//
//  Created by SWUCOMPUTER on 2017. 11. 30..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class PlannerViewController: UIViewController {
    
    @IBOutlet var textTitle: UITextField!
    @IBOutlet var textList: UITextField!
    @IBOutlet var textMemo: UITextView!
    @IBOutlet var memoView: UIView!
    
    @IBOutlet var startDate: UILabel!
    @IBOutlet var finalDate: UILabel!
    
    
    var detailPlan: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let plan = detailPlan {
            textTitle.text = plan.value(forKey: "title") as? String
            textList.text = plan.value(forKey: "content") as? String
            textMemo.text = plan.value(forKey: "memo") as? String
            let dbDate: Date? = plan.value(forKey: "saveDate") as? Date
            finalDate.text = plan.value(forKey: "finalDate") as? String
            
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            if let unwrapDate = dbDate {
                let displayDate = formatter.string(from: unwrapDate as Date)
                startDate.text = displayDate
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
