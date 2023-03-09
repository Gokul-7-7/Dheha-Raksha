//
//  ViewController.swift
//  Dheha Raksha
//
//  Created by Gokul on 06/03/23.
//
///Here is where we should import libraries
import UIKit
import MongoSwift

///View controller is the first page of this application
class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///Call functions this way:
       // addTwoNumbers(numOne: 1, numTwo: 2)
        
       /// assign the returned value to a property
        /// let - constant, var - variable
        /// you don't need to implicitly mention type of the property, swift will automatically assign type according to the given value
        let total = addTwoNumbers(numOne: 1, numTwo: 2)
        //If you want to explicitly mention value type then
        let someString: String = "Hello"
        ///Print on the debug console : if hidden cmnd + shift + y
        print(total)
    }
    
    ///Write functions this way
    func addTwoNumbers(numOne: Int, numTwo: Int) -> Int {
        return numOne + numTwo
    }
    
}
///View did load gets called after the app loads up
///so all the functions should be called inside that for the functions to work
