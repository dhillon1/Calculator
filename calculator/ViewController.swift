/*
 * AppDelegate.swift
 * Project: Calculator
 * Name: Simranjeet Singh Dhillon
 * StudentID: 301093914
 * Version: V6 - Logic for + button created
 */


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelUp: UILabel!
    @IBOutlet weak var labelDown: UILabel!
    @IBOutlet weak var labelMid: UILabel!
    private var m_operand1 = "0",m_operand2 = "0"
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
            if(!m_operand1.contains(".")){
                m_operand1 += calculatorButton!
                labelDown.text = m_operand1
            }
            break
        case "+":
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(a + b)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(a + b)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                case "-":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(b - a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b - a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "×":
                    break
                case "÷":
                    break
                case "%":
                    break
                default:
                    labelUp.text = m_operand1
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    labelMid.text = "+"
                    }
                m_operator = "+"
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
            m_operand1 = String (m_operand1.dropLast())
            if(m_operand1.count == 0){
                m_operand1 = "0"
            }
            labelDown.text = m_operand1
            break
            
        case"CE":
            m_operand1 = "0"
            labelDown.text = "0"
            labelUp.text = ""
            break
            
        case"+/-":
            break
            
        default:
            if(m_operand1 == "0"){
                m_operand1 = calculatorButton!
            }
            else{
                m_operand1 += calculatorButton! }

            labelDown.text  = m_operand1
            
            
        }
        
        
        
        
        
    }
    
}

