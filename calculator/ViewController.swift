/*
 * AppDelegate.swift
 * Project: Calculator
 * Name: Simranjeet Singh Dhillon
 * StudentID: 301093914
 * Version: V2 - Connection made
 */


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelUp: UILabel!
    @IBOutlet weak var labelDown: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelUp.text = "9"
        labelDown.text = "+"
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


  
    @IBAction func buttonAction(_ sender: UIButton) {
        
        
        
    }
    
}

