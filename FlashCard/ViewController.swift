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
    // alerts
    var addCardAlert : UIAlertController!
    var deleteCardAlert : UIAlertController!
    var warningAlert : UIAlertController!
    
    // vars to store objects
    var listOfCards = [Flashcard]()
    var listOfViewedCars = [Flashcard]()
    var randomNumber : Int!
    var cardToPresent : Flashcard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        managedObjectContext = appDelegate.persistentContainer.viewContext
        fetchCards()
        loadFlashCard()
        
    }

    @IBAction func addCard(_ sender: UIButton) {
        addCardAlert = UIAlertController(title: "Add new card", message: "Enter a question and an answer", preferredStyle: UIAlertControllerStyle.alert)
        addCardAlert.addTextField { (textField1) in
           textField1.placeholder = "Enter a question here!"
        }
        
        addCardAlert.addTextField { (textField2) in
            textField2.placeholder = "Enter answer here!"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        let addCardAction = UIAlertAction(title: "Add Card", style: UIAlertActionStyle.default) { (action) in
            self.addCardToDatabase(question: self.addCardAlert.textFields![0].text!, answer: self.addCardAlert.textFields![1].text!)
        }
        
        self.addCardAlert.addAction(cancelAction)
        self.addCardAlert.addAction(addCardAction)
        
        self.present(self.addCardAlert, animated: true, completion: nil)
    }
    
    @IBAction func deleteCard(_ sender: UIButton) {
        
    }
    
    @IBAction func tapLabel(_ sender: UITapGestureRecognizer) {
        
    }
    
    func addCardToDatabase(question : String, answer : String) {
        let newCard = NSEntityDescription.insertNewObject(forEntityName: "Flashcard", into: managedObjectContext) as! Flashcard
        
        newCard.question = question
        newCard.answer = answer
        do {
            try managedObjectContext.save()
            listOfCards.append(newCard)
            print("Flash card: \(newCard) saved to database")
        } catch {
            print("Could not save")
        }
    
    }
    
    func deleteCardFromDatabase() {
        
    }
    
    func fetchCards() {
        let fetchCard : NSFetchRequest<Flashcard> = Flashcard.fetchRequest()
        
        do {
            listOfCards = try managedObjectContext.fetch(fetchCard)
            print("Flash cards fetched successfuly...")
        } catch {
            print("Could not fetch flash cards...")
        }
    }
    
    func loadFlashCard() {
        randomNumber = Int(arc4random_uniform(UInt32(listOfCards.count)))
        cardToPresent = listOfCards[randomNumber]
        if listOfViewedCars.contains(cardToPresent) {
            loadFlashCard()
        } else {
            listOfViewedCars.append(cardToPresent)
        }
        if listOfViewedCars == listOfCards {
            listOfViewedCars.removeAll()
        }
        lblDisplayCard.text = cardToPresent.question!
        
    }
    
//    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
//
//    }
}










