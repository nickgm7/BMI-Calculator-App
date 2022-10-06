//
//  ViewController.swift
//  BMI_Calculator_App
//
//  Created by Nick Meyer on 1/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var message: UILabel!
    
    @IBAction func calculate(_ sender: UIButton, forEvent event: UIEvent) {
        //check if not numbers entered set weight and height to 0
        if(Double(height.text!) == nil || Double(weight.text!) == nil)
        {
            height.text = "0";
            weight.text = "0";
            message.text = "Numbers Only!";
            message.textColor = UIColor.red;
            return;
        }
        //initilize variables
        let h: Double? = Double(height.text!);
        let w: Double? = Double(weight.text!);
        //calculate bmi
        var c: Double? = w! / (h! * h!);
        c = c! * 703;
        //convert bmi value to string
        let bmi_calculated = String(c!);
        //update bmi label
        bmi.text = bmi_calculated;
        //update message based on bmi
        fitness_level(c: c!);
    }
    
    func fitness_level(c: Double){
        var msg: String = "";
        if(c < 18){
            msg = "You are underweight";
            message.text = msg;
            message.textColor = UIColor.blue;
        }
        if(c >= 18 && c < 25){
            msg = "You are normal";
            message.text = msg;
            message.textColor = UIColor.green;
        }
        if(c >= 25 && c < 30){
            msg = "You are pre-obese";
            message.text = msg;
            message.textColor = UIColor.purple;
        }
        if(c > 30){
            msg = "You are obese";
            message.text = msg;
            message.textColor = UIColor.red;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

