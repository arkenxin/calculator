//
//  SecondViewController.swift
//  calculator1
//
//  Created by jinikuadmin on 1/17/17.
//  Copyright © 2017 xin. All rights reserved.
//
import Foundation
import UIKit

protocol DataSentDelegate {
    func userSavedData(data: Double)
    
}

class SecondViewController: UIViewController {

    @IBOutlet weak var currency1: AllowedCharsTextField!
    @IBOutlet weak var currency2: AllowedCharsTextField!
    @IBOutlet weak var conversionData: UILabel!
    var result = Double()
    
    var delegate:DataSentDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currency1.maxLength = 9
        currency1.allowedChars = "0123456789."
        currency2.maxLength = 9
        currency2.allowedChars = "0123456789."
        conversionData.text = ""

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
       
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnSaveSettings(_ sender: Any) {
        
        let num1 = Double(currency1.text!)
        let num2 = Double(currency2.text!)
        
        //if delegate != nil
       //   {
            if num1 != nil && num2 != nil
             {
                let result = (num1! / num2! * 100)
                let result2 = String(format: "%.2f", arguments: [result])
                
                conversionData.text = "100 JYP is \(result2) SGD"
                
                let data = result
                delegate?.userSavedData(data: data)
             }
            else
             {
                conversionData.text = "Please enter both values"
             }
      //  }
        
    }
    
    @IBAction func btnReset(_ sender: Any) {
        currency1.text = ""
        currency2.text = ""
        conversionData.text = ""
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
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
