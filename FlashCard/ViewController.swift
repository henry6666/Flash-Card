//
//  ViewController.swift
//  FlashCard
//
//  Created by Henry Aguinaga on 2018-10-10.
//  Copyright © 2018 Henry Aguinaga. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var managedObjectContext : NSManagedObjectContext!
    
    @IBOutlet weak var lblDisplayCard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        
    }

    @IBAction func addCard(_ sender: UIButton) {
    }
    
    @IBAction func deleteCard(_ sender: UIButton) {
    }
    
    @IBAction func tapLabel(_ sender: UITapGestureRecognizer) {
    }
    
}

