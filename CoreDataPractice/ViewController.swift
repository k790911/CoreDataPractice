//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 김재훈 on 2022/01/15.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var container: NSPersistentContainer!

    @IBOutlet var lblMemo: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
    }
    @IBAction func btnStore(_ sender: UIButton) {
        let entity = NSEntityDescription.entity(forEntityName: "PhoneBook", in: self.container.viewContext)
        
        let person = NSManagedObject(entity: entity!, insertInto: self.container.viewContext)
        person.setValue("잘 저장 돼앵?", forKey: "memo")
        person.setValue("Pingu", forKey: "personName")
        person.setValue("010-0000-0000", forKey: "phoneNumber")
        
        do {
            try self.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func fetchContact(_ sender: UIButton) {
        do {
            let contact = try self.container.viewContext.fetch(PhoneBook.fetchRequest())
            contact.forEach {
                lblMemo.text = $0.memo
                lblName.text = $0.personName
                lblNumber.text = $0.phoneNumber
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

