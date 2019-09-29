/*
 * AppDelegate.swift
 * Project: Calculator
 * Name: Simranjeet Singh Dhillon
 * StudentID: 301093914
 * Version: V8 - Issue resolved for all the operator buttons
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
            if(labelDown.text != ""){
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
                        labelUp.text = String(format: "%.2f",b - a)
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
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(b * a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b * a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "÷":
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.2f", (b.truncatingRemainder(dividingBy:a)))
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b % a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                default:
                    labelUp.text = m_operand1
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                }
            }
            m_operator = "+"
            labelMid.text = "+"
            break
            
            
            
            
            
            
            //Equals
            
            
            
            
            
        case"=":
            if(labelDown.text != ""){
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(a + b)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelDown.text = String(a + b)
                    }
                    break
                    
                case "-":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(b - a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelDown.text = String(b - a)
                    }
                    
                    break
                case "×":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(b * a)
                        print(b + a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelDown.text = String(b * a)
                    }
                    break
                case "÷":
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelDown.text = String(format: "%.2f",b / a)
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(format: "%.1f", (b.truncatingRemainder(dividingBy:a)))
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelDown.text = String(b % a)
                    }
                    break
                default:
                    break
                }
                m_operator = ""
                labelMid.text = ""
                labelUp.text = ""
                m_operand2 = "0"
                m_operand1 = labelDown.text!
                return
            }
            labelDown.text = m_operand2
            m_operator = ""
            labelMid.text = ""
            labelUp.text = ""
            m_operand2 = "0"
            m_operand1 = labelDown.text!
            break
            
            
            
            // Subtraction




        case "-":
            if(labelDown.text != ""){
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
                        labelUp.text = String(format: "%.2f",b - a)
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
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(b * a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b * a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "÷":
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.2f", (b.truncatingRemainder(dividingBy:a)))
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b % a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                default:
                    labelUp.text = m_operand1
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                }
            }
            m_operator = "-"
            labelMid.text = "-"

            break








    
            
            //Multiplication





        case "×":
            if(labelDown.text != ""){
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
                        labelUp.text = String(format: "%.2f",b - a)
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
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(b * a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b * a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "÷":
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.2f", (b.truncatingRemainder(dividingBy:a)))
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b % a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                default:
                    labelUp.text = m_operand1
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                }
            }
            m_operator = "×"
            labelMid.text = "×"
            
            break





            //Dividation





        case "÷":
            if(labelDown.text != ""){
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
                        labelUp.text = String(format: "%.2f",b - a)
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
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(b * a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b * a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "÷":
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.2f", (b.truncatingRemainder(dividingBy:a)))
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b % a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                default:
                    labelUp.text = m_operand1
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                }
            }
            m_operator = "÷"
            labelMid.text = "÷"
            break





        case "%":
            if(labelDown.text != ""){
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
                        labelUp.text = String(format: "%.2f",b - a)
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
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(b * a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b * a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "÷":
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.2f", (b.truncatingRemainder(dividingBy:a)))
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelUp.text = String(b % a)
                    }
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                default:
                    labelUp.text = m_operand1
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                }
            }
            m_operator = "%"
            labelMid.text = "%"
            break


        case"C":
            m_operand1 = String (m_operand1.dropLast())
            if(m_operand1.count == 0){
                if(labelUp.text!.count>0){
                    labelDown.text = ""
                    m_operand1 = "0"
                }
                else{
                    m_operand1 = "0"
                    labelDown.text = m_operand1
                }
            }
            break

        case"CE":
            m_operand1 = "0"
            labelDown.text = "0"
            labelUp.text = ""
            m_operator = ""
            m_operand2 = "0"
            labelMid.text = ""
            break

        case"+/-":
            if(m_operand1 != "0" ){
                if(m_operand1.contains("-")){
                    m_operand1 = String(m_operand1.dropFirst())
                    labelDown.text = m_operand1
                    return
                }
            m_operand1 = "-\(m_operand1)"
            labelDown.text = m_operand1
            }

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

