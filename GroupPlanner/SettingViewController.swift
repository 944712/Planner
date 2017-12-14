//
//  SettingViewController.swift
//  02
//
//  Created by SWUCOMPUTER on 2017. 12. 2..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import EventKit

class SettingViewController: UIViewController {

    @IBOutlet var datepicker: UIDatePicker!
    
    var eventStore: EKEventStore?
    
    var endDate: String?
    var mainVC: PlanViewController? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let saveBtn:UIBarButtonItem = UIBarButtonItem(title: "Save",style: UIBarButtonItemStyle.plain, target:self, action: #selector(saveSettings))
        self.navigationItem.rightBarButtonItem = saveBtn
        
        let currentDate = Date()
        datepicker.minimumDate = currentDate

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveSettings() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        endDate = dateFormatter.string(from: self.datepicker.date)
            
        self.mainVC?.textDate.text = self.endDate
            
            if self.eventStore == nil {
                //모든 view controller는 이벤트 스토어가 있고 없으면 새로 만들어주는 것
                self.eventStore = EKEventStore()
                // 접근권한 요청
                self.eventStore!.requestAccess(to: EKEntityType.reminder, completion:{(isAccessible,errors) in })
            }
            
            let predicateForEvents:NSPredicate = self.eventStore!.predicateForReminders(in: [self.eventStore!.defaultCalendarForNewReminders()])
            self.eventStore!.fetchReminders (matching: predicateForEvents, completion: { (reminders) in
                for reminder in reminders! {
                    if reminder.title == "Plan deadline" {
                        do {
                            try self.eventStore!.remove(reminder, commit: true)
                        } catch {
                        } }
                } })
            
            
            let reminder = EKReminder(eventStore: self.eventStore!)
            reminder.title = "Plan deadline"
            reminder.calendar = self.eventStore!.defaultCalendarForNewReminders()
            let alarm = EKAlarm(absoluteDate: datepicker.date)
            reminder.addAlarm(alarm)
            do {
                try self.eventStore!.save(reminder, commit: true)
            } catch {
                NSLog("미리 알림 설정 실패") }
            
            self.navigationController?.popViewController(animated: true)
            
            
        }

}
