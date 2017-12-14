//
//  RankViewController.swift
//  GroupPlanner
//
//  Created by SWUCOMPUTER on 2017. 12. 7..
//  Copyright © 2017년 Computer Science. All rights reserved.
//

import UIKit
import CoreData

class RankViewController: UIViewController {

    @IBOutlet var theFirst: UILabel!
    @IBOutlet var theSecond: UILabel!
    @IBOutlet var theThird: UILabel!
    
    var listVC: RankListTableViewController? = nil


    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let study : String = "총 공부량: "
        let per: String = "%"
        listVC?.rankArray.sort(by:{$0 > $1})
        
        if listVC?.rankArray.count == 0{
            theFirst.text = study
            theSecond.text = study
            theThird.text = study
        }
        else if listVC?.rankArray.count == 1{
            theFirst.text = study+"\(listVC!.rankArray[0])"+per
            theSecond.text = study
            theThird.text = study

        }
        else if listVC?.rankArray.count == 2 {
            theFirst.text = study+"\(listVC!.rankArray[0])"+per
            theSecond.text = study+"\(listVC!.rankArray[1])"+per
            theThird.text = study
            
        }
        else{
            theFirst.text = study+"\(listVC!.rankArray[0])"+per
            theSecond.text = study+"\(listVC!.rankArray[1])"+per
            theThird.text = study+"\(listVC!.rankArray[2])"+per
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
