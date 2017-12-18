//
//  PlanViewController.swift
//  Assignment2
//
//  Created by SWUCOMPUTER on 2017. 11. 26..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class PlanViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textTitle: UITextField!
    @IBOutlet var textList: UITextField!
    @IBOutlet var textMemo: UITextView!
    @IBOutlet var memoView: UIView!
    @IBOutlet var textDate: UILabel!
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleView(_ sender: UISwitch) {
        self.memoView.isHidden = !sender.isOn
    }
    
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Plan", in: context)
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textTitle.text, forKey: "title")
        object.setValue(textList.text, forKey: "content")
        object.setValue(textMemo.text, forKey: "memo")
        object.setValue(Date(), forKey: "saveDate")
        object.setValue(textDate.text, forKey: "finalDate")
       
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        // 현재의 View를 없애고 이전 화면으로 복귀
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDateView" {
            if let destVC = segue.destination as? SettingViewController{
                destVC.mainVC = self
            }
        }
    
    
    }
}
