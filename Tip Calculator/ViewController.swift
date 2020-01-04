//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kevin Grewal on 12/20/19.
//  Copyright © 2019 Kevin Grewal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var defaultTip: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
        
    }

   /* override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }*/
    @IBAction func defaultButton(_ sender: Any) {
        
        let differentTips = [0.10,0.15,0.18,0.2]
    UserDefaults.standard.set(differentTips[defaultTip.selectedSegmentIndex], forKey: "defaultTip")
        
        
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        //calculate tip and total
        let tipPercentages = [0.10,0.15,0.18,0.2]
        let peopleIndex = [1,2,3,4,5]
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let peopleTotal = total/Double(peopleIndex[peopleControl.selectedSegmentIndex])
       // let perPersonTotal = total/peopleSplit[peopleControl.selectedSegmentIndex]
        //update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", peopleTotal)
        //perPerson.text = String(format: "$%.2f", perPersonTotal)
        
        
    }
    
}

