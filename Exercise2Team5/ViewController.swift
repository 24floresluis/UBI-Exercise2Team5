//
//  ViewController.swift
//  Exercise2Team5
//
//  Created by ubicomp5 on 8/30/18.
//  Copyright © 2018 cpl.ubicomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var languages:[String:String] = [
        "Java": "986K",
        "Python": "1M",
        "R": "68K",
        "Swift": "107K",
        "C++": "413K",
        "C#": "326K"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var TextOutputLabel: UILabel!
    
    @IBAction func luckyOutputButton(_ sender: Any) {
        if nameField.hasText {
            let indexs: Int = Int(arc4random_uniform(UInt32(languages.count)))
            
            let randomVal = Array(languages.keys)[indexs]
            TextOutputLabel.text = ("Hello from \(randomVal), \(nameField.text!) \n (\(languages[randomVal]!) people are using me)")
        }
        else {
            let noNameAlert = UIAlertController(title: "Missing Name", message: "Enter your name!", preferredStyle: .alert)
            noNameAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in noNameAlert.dismiss(animated: true, completion: nil )}))
            self.present(noNameAlert,animated: true,completion: nil)
        }
        
    }
    
    @IBAction func pickLanguage(_ sender: Any) {
        if nameField.hasText {
            
            let actionSheet = UIAlertController(title: "Language Actionsheet", message: "Pick a language", preferredStyle: .actionSheet)
            
            for (language) in languages{
                 actionSheet
                    .addAction(
                        UIAlertAction(
                            title: "\(language.key)",
                            style: .default,
                            handler: {_
                                in actionSheet.dismiss(animated: true, completion: nil)
                                self.TextOutputLabel.text = ("Hello from \(language.key), \(self.nameField.text!) \n (\(self.languages[language.key]!) people are using me)")
                            }
                        )
                    )
            }
            
           actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in actionSheet.dismiss(animated: true, completion: nil )}))
            self.present(actionSheet,animated: true,completion: nil)
            
            
        }
        else {
            let noNameAlert = UIAlertController(title: "Missing Name", message: "Enter your name!", preferredStyle: .alert)
            noNameAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in noNameAlert.dismiss(animated: true, completion: nil )}))
            self.present(noNameAlert,animated: true,completion: nil)
        }
    }
    
    
    


}

