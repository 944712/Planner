//
//  CommentViewController.swift
//  Assignment2
//
//  Created by SWUCOMPUTER on 2017. 11. 26..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

//  DoPlan

import UIKit
import CoreData

class CommentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textName: UITextField!
    @IBOutlet var textComment: UITextView!
    @IBOutlet weak var textUnderstand: UILabel!
    
    
    
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
    
   
    @IBAction func slider(_ sender: UISlider) {
        let sliderValue:Int = Int(sender.value)
        textUnderstand.text = "\(sliderValue)"
        
    }
    
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Comment", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textName.text, forKey: "name")
        object.setValue(textComment.text, forKey: "comment")
        object.setValue(textUnderstand.text, forKey: "understand")
        object.setValue(Date(), forKey: "today")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
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
