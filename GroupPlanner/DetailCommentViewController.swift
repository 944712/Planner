//
//  DetailCommentViewController.swift
//  02
//
//  Created by SWUCOMPUTER on 2017. 12. 2..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData


class DetailCommentViewController: UIViewController {

    @IBOutlet var textName: UILabel!
    @IBOutlet var textUnderstand: UILabel!
    @IBOutlet var textContent: UILabel!
    
    
    var detailComment: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detail = detailComment {
            let got = detail.value(forKey: "understand") as? String

            textName.text = detail.value(forKey: "name") as? String
            textContent.text = detail.value(forKey: "comment") as? String

            textUnderstand.text = got
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
