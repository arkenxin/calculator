//
//  ViewController.swift
//  calculator1
//
//  Created by jinikuadmin on 1/15/17.
//  Copyright © 2017 xin. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController, DataSentDelegate {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    var conversionValue:Double = 0
    
    //name 2 labels label (original) and label (converted) respectively
    @IBOutlet weak var labelOri: UILabel!

    @IBOutlet weak var labelCon: UILabel!
    @IBOutlet weak var labelErrorMessage: UILabel!
    
    @IBAction func btnNumbers(_ sender: UIButton) {
        
        if performingMath == true
        {
            labelOri.text = String(sender.tag-1)
            numberOnScreen = Double(labelOri.text!)!
            performingMath = false
        }
        else
        {
            labelOri.text = labelOri.text! + String(sender.tag-1)
            numberOnScreen = Double(labelOri.text!)!
        }
        
    }
    
    @IBAction func btnConvert(_ sender: UIButton) {
     
        if labelOri.text?.isEmpty == true
        { labelErrorMessage.text = "No number detected"
        }
        else
        {
            //let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            
            //let conversionValue:Double = SecondViewController.result
            
            //error
            //if conversionValue != nil
            //{
            //labelErrorMessage.text = "No settings detected"
            //}
            //else {
              //
            let convertedNumber = numberOnScreen * 1.24
                let convertedNumberShortened = String(format: "%.1f", arguments: [convertedNumber])
           labelCon.text = convertedNumberShortened
            //}
        }
    }
    
    @IBAction func btnFunction(_ sender: UIButton)
    {
        
        if labelOri.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17
        {
            previousNumber = Double(labelOri.text!)!
            
            if sender.tag == 12 //Divide
            {
                labelOri.text = "÷"
            }
            else if sender.tag == 13 //Multiply
            {
                labelOri.text = "×"
            }
            else if sender.tag == 14 //subtraction
            {
                labelOri.text = "-"
            }
            else if sender.tag == 15 //addition
            {
                labelOri.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16
        {
            if operation == 12 //divide
            {
                labelOri.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 //multiply
            {
                labelOri.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 //subtraction
            {
                labelOri.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 //addition
            {
                labelOri.text = String(previousNumber + numberOnScreen)
            }
        
        }
        
        else if sender.tag == 11 //reset
        {
            labelOri.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
        //else if sender.tag == 17 //backspace
        //{
           // if (labelOri.text!).characters.count > 2
            //{
           //   labelOri.text!.characters.dropLast(1)
             //   labelOri.text = func dropNumber
         //   }
         //   else
          //  {   labelOri.text = ""
           // }
       // }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func userSavedData(data: Double) {
        conversionValue = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

