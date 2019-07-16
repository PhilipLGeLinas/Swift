//
//  FirstViewController.swift
//  iQuest
//
//  Created by Philip GeLinas on 7/13/19.
//  Copyright © 2019 Philip GeLinas Inc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // Countries visited counter
    @IBOutlet weak var Counter: UILabel!
    
    // Checkmarks
    @IBOutlet weak var Afghanistan_Checkmark: UILabel!
    @IBOutlet weak var Albania_Checkmark: UILabel!
    @IBOutlet weak var Algeria_Checkmark: UILabel!
    @IBOutlet weak var Andorra_Checkmark: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Afghanistan_Tap(_ sender: Any) {
        if (Afghanistan_Checkmark.isHidden) {
            Afghanistan_Checkmark.isHidden = false
            Counter.text = String(Int(Counter.text!)! + 1)
        } else {
            Afghanistan_Checkmark.isHidden = true
            Counter.text = String(Int(Counter.text!)! - 1)
        }
    }
    
    @IBAction func Afghanistan_Long(_ sender: Any) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Afghanistan") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func Albania_Tap(_ sender: Any) {
        if (Albania_Checkmark.isHidden) {
            Albania_Checkmark.isHidden = false
            Counter.text = String(Int(Counter.text!)! + 1)
        } else {
            Albania_Checkmark.isHidden = true
            Counter.text = String(Int(Counter.text!)! - 1)
        }
    }
    
    @IBAction func Albania_Long(_ sender: Any) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Albania") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func Algeria_Tap(_ sender: Any) {
        if (Algeria_Checkmark.isHidden) {
            Algeria_Checkmark.isHidden = false
            Counter.text = String(Int(Counter.text!)! + 1)
        } else {
            Algeria_Checkmark.isHidden = true
            Counter.text = String(Int(Counter.text!)! - 1)
        }
    }
    
    @IBAction func Algeria_Long(_ sender: Any) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Algeria") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func Andorra_Tap(_ sender: Any) {
        if (Andorra_Checkmark.isHidden) {
            Andorra_Checkmark.isHidden = false
            Counter.text = String(Int(Counter.text!)! + 1)
        } else {
            Andorra_Checkmark.isHidden = true
            Counter.text = String(Int(Counter.text!)! - 1)
        }
    }
    
    @IBAction func Andorra_Long(_ sender: Any) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Andorra") {
            UIApplication.shared.open(url)
        }
    }
}

