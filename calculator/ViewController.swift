/*
 * AppDelegate.swift
 * Project: Calculator
 * Name: Simranjeet Singh Dhillon
 * StudentID: 301093914
 * Version: V5 - Logic for . button created
 */


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelUp: UILabel!
    @IBOutlet weak var labelDown: UILabel!
    private var m_operand = "0"
    private var m_operator = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelUp.text = ""
        labelDown.text = "0"
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


  
    @IBAction func keys(_ sender: UIButton) {
        var calculatorButton = sender.titleLabel?.text
        
        switch (calculatorButton) {
        case ".":
            if(!m_operand.contains(".")){
            m_operand += calculatorButton!
                labelDown.text = m_operand
            }
            
            break
        case "+":
            
            break
        case"=":
            break
        case "-":
            break
        case "×":
            break
        case "÷":
            break
        case "%":
            break
            
        case"C":
            m_operand = String (m_operand.dropLast())
            if(m_operand.count == 0){
                m_operand = "0"
            }
            labelDown.text = m_operand
            break
            
        case"CE":
            m_operand = "0"
            labelDown.text = "0"
            labelUp.text = ""
            break
            
        case"+/-":
            break
            
        default:
            if(m_operand == "0"){
                m_operand = calculatorButton!
            }
            else{
                m_operand += calculatorButton! }
            
            labelDown.text  = m_operand
            
            
        }
        
        
        
        
        
    }
    
}

