//
//  ViewController.swift
//  Dheha-Raksha
//
//  Created by Gokul on 09/03/23.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
   
    
    @IBOutlet var tableView: UITableView!
    var ref: DatabaseReference?
    var dataBaseHandle: DatabaseHandle?
    
    var dict: [String:Double]? {
        didSet {
            print("dictionary updated from firebase")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the fireBase reference
        ref = Database.database().reference()
        //Retrieve the data and listen for updates
        dataBaseHandle = ref?.child("test").observe(.value, with: { snapShot in
            self.dict = snapShot.value as? [String:Double] ?? [:]
            print(self.dict ?? [:])
            print(snapShot)
            self.makeApiCall()
        })

        // Schedule a timer to call the function every 10 seconds
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            if self.dict != [:] {
                self.makeApiCall()
            }
        }
        // Start the timer
        timer.fire()
    }
    
    func setupUrl() -> String {
        return ""
    }
    
    func makeApiCall() {
        let name = "karthi"
        let pulseRate = dict?["PulseRate"]
        let sp02 = dict?["SPO2"]
        let temp = dict?["Temp"]
        let systalic = dict?["systalic"]
        let diastalic = dict?["diastalic"]
        ApiManager.shared.callTheApi(url: "http://192.168.29.203:8080/arogyasuraksha/GokulTest?name=\(name)&pulseRate=\(pulseRate ?? 0)&SP02=\(sp02 ?? 0)&temp=\(temp ?? 0)&systalic=\(systalic ?? 0)&diastalic=\(diastalic ?? 0)") { response in
            switch response {
            case .success(let teamResponse):
                if teamResponse == true {
                    print("successful response")
                } else {
                    print("failure inside success block")
                }
                //Handle success case
            case .failure(let error):
                print("failure block, \(error)")
            }
        }
    }
}

