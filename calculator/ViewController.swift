/*
 * AppDelegate.swift
 * Project: Calculator
 * Name: Simranjeet Singh Dhillon
 * StudentID: 301093914
 * Version: V17 - Alpha version
 */


import UIKit

class ViewController: UIViewController {
    
    /*
     *Three UI label window are created for the repective job.
     *first and third for previous and current operand.
     * middle one for operator.
     */
    @IBOutlet weak var labelUp: UILabel!
    @IBOutlet weak var labelDown: UILabel!
    @IBOutlet weak var labelMid: UILabel!
    private var m_operand1 = "0"
    private var m_operand2 = "0"
    private var m_operator = ""
    private var m_input1_int: Double = 0.0
    private var m_input2_int: Double = 0.0
    private var m_output_int = 0
    private var m_input1_double = 0.0
    private var m_input2_double = 0.0
    private var m_output_double = 0.0
    private var m_position = 0
    private var m_point = 0
    private var m_length = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelUp.text = ""
        labelMid.text = ""
        labelDown.text = "0"
        
    }
    // Changed the status bar color from default (dark) to the light color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // All buttons are connected. This function is called when the button is clicked.
    @IBAction func keys(_ sender: UIButton) {
        var calculatorButton = sender.titleLabel?.text
        
        //If text of button matches with the switch statement case then execution of case begins.
        switch (calculatorButton) {
            
        //case for "." button
        case ".":
            //called when label has some input
            if(!m_operand1.contains(".")){
                m_operand1 += calculatorButton!
                labelDown.text = m_operand1
            }
            break
            
            
            /*
             Addition*****Addition*****Addition*****Addition*****Addition*****Addition*****Addition*****
             Addition*****Addition*****Addition*****Addition*****Addition*****Addition*****Addition*****
             Addition*****Addition*****Addition*****Addition*****Addition*****Addition*****Addition*****
             */
            
            
            /*
             Case for "+" button
             this case has nested switch statement
             the use case of nested switch statement helps in executing the operator stored in variable m_operator
             */
        case "+":
            if(labelDown.text != ""){
                
                if(labelDown.text == "Error"){
                    return
                }
                
                //function LabelDownPoint helps to check if the value of input is "9." and then we click operator button
                // so in conditions like these value should be converted to "9"
                m_point = LabelDownPoint(label: m_operand1)
                if(m_point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                
                // perform the operation in the case
                // the case is executed having the value of operator
                switch (m_operator){
                case "+":
                    
                    // statement is called if operand contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double + m_input1_double)
                           
                    }
                        
                    else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int + m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "-":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double - m_input1_double)
                    }
                        
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int - m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "×":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double * m_input1_double)
                            
                    
                    }
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int * m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "÷":
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    //function Dot postion checks for the rounding of output to the how many decimal places.
                    // This function gives the Integer value for decimal places to round off.
                    m_input1_double = Double (m_operand1)!
                    m_input2_double = Double (m_operand2)!
                    
                    
                    //UI is updated
                    labelUp.text = String(format: "%.3f",m_input2_double / m_input1_double)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    
                    break
                    
                    
                    
                case "%":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.3f", m_input2_double.truncatingRemainder(dividingBy:m_input1_double))
                    }else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int.truncatingRemainder(dividingBy:m_input1_int))
                        
                    }
                    
                    //UI is updated
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
            
            
            /*
             Equals*****Equals*****Equals*****Equals*****Equals*****Equals*****Equals*****
             Equals*****Equals*****Equals*****Equals*****Equals*****Equals*****Equals*****
             Equals*****Equals*****Equals*****Equals*****Equals*****Equals*****Equals*****
             */
            
            
            /*
             Case for "=" button
             this case has nested switch statement
             the use case of nested switch statement helps in executing the operator stored in variable m_operator
             */
        case"=":
            
            if(labelDown.text != ""){
                
                if(labelDown.text == "Error"){
                    return
                }
                
                m_point = LabelDownPoint(label: m_operand1)
                if(m_point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                    labelDown.text = m_operand1
                }
                switch (m_operator){
                case "+":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelDown.text = String(format: "%.\(m_position)f",m_input2_double + m_input1_double)
                    }else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelDown.text = String(format: "%.0f",m_input2_int + m_input1_int)
                    }
                    break
                    
                case "-":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelDown.text = String(format: "%.\(m_position)f",m_input2_double - m_input1_double)
                    }else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelDown.text = String(format: "%.0f",m_input2_int - m_input1_int)
                    }
                    
                    break
                    
                    
                case "×":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelDown.text = String(format: "%.\(m_position)f",m_input2_double * m_input1_double)
                    }else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelDown.text = String(format: "%.0f",m_input2_int * m_input1_int)
                    }
                    break
                    
                    
                case "÷":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    //function Dot postion checks for the rounding of output to the how many decimal places.
                    // This function gives the Integer value for decimal places to round off.
                    m_input1_double = Double (m_operand1)!
                    m_input2_double = Double (m_operand2)!
                    labelDown.text = String(format: "%.3f",m_input2_double / m_input1_double)
                    break
                    
                    
                case "%":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelDown.text = String(format: "%.3f", (m_input2_double.truncatingRemainder(dividingBy:m_input1_double)))
                    }else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelDown.text = String(format: "%.0f",m_input2_int.truncatingRemainder(dividingBy:m_input1_int))
                    }
                    break
                default:
                    break
                }
                
                //UI is update
                m_operator = ""
                labelMid.text = ""
                labelUp.text = ""
                m_operand2 = "0"
                m_operand1 = labelDown.text!
                return
            }
            
            //UI is update
            labelDown.text = m_operand2
            m_operator = ""
            labelMid.text = ""
            labelUp.text = ""
            m_operand2 = "0"
            m_operand1 = labelDown.text!
            break
            
            
            
            
        /*
        Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****
        Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****
        Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****Subtraction*****
        */
            
            
            
        case "-":
            
            if(labelDown.text != ""){
                
                if(labelDown.text == "Error"){
                    return
                }
                
                //function LabelDownPoint helps to check if the value of input is "9." and then we click operator button
                // so in conditions like these value should be converted to "9"
                m_point = LabelDownPoint(label: m_operand1)
                if(m_point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                
                // perform the operation in the case
                // the case is executed having the value of operator
                switch (m_operator){
                    
                case "+":
                    
                    // statement is called if operand contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double + m_input1_double)
                    }
                        
                    else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int + m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "-":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double - m_input1_double)
                    }
                        
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        
                        labelUp.text = String(format: "%.0f",m_input2_int - m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "×":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double * m_input1_double)
                    }
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int * m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "÷":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    //function Dot postion checks for the rounding of output to the how many decimal places.
                    // This function gives the Integer value for decimal places to round off.
                    
                    m_input1_double = Double (m_operand1)!
                    m_input2_double = Double (m_operand2)!
                    
                    //UI is updated
                    labelUp.text = String(format: "%.3f",m_input2_double / m_input1_double)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                    
                case "%":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.3f", (m_input2_double.truncatingRemainder(dividingBy:m_input1_double)))
                    }else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int.truncatingRemainder(dividingBy:m_input1_int))
                        
                    }
                    
                    //UI is updated
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
            
            
            
            
            
        /*
        Multiplication*****Multiplication*****Multiplication*****Multiplication*****Multiplication*****Multiplication*****
        Multiplication*****Multiplication*****Multiplication*****Multiplication*****Multiplication*****Multiplication*****
        Multiplication*****Multiplication*****Multiplication*****Multiplication*****Multiplication*****Multiplication*****
        */
            
            
            
            
            
        case "×":
            
            if(labelDown.text != ""){
                
                if(labelDown.text == "Error"){
                    return
                }
                
                //function LabelDownPoint helps to check if the value of input is "9." and then we click operator button
                // so in conditions like these value should be converted to "9"
                m_point = LabelDownPoint(label: m_operand1)
                if(m_point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                
                // perform the operation in the case
                // the case is executed having the value of operator
                switch (m_operator){
                    
                case "+":
                    
                    // statement is called if operand contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double + m_input1_double)
                    }
                        
                    else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int + m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "-":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double - m_input1_double)
                    }
                        
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int - m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "×":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double * m_input1_double)
                    }
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int * m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "÷":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    //function Dot postion checks for the rounding of output to the how many decimal places.
                    // This function gives the Integer value for decimal places to round off.
                    
                    m_input1_double = Double (m_operand1)!
                    m_input2_double = Double (m_operand2)!
                    
                    //UI is updated
                    labelUp.text = String(format: "%.3f",m_input2_double / m_input1_double)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                    
                case "%":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.3f", (m_input2_double.truncatingRemainder(dividingBy:m_input1_double)))
                    }else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int.truncatingRemainder(dividingBy:m_input1_int))
                        
                    }
                    
                    //UI is updated
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
            
            
            
            
            
            /*
             Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****
             Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****
             Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****Dividation*****
             */
            
            
            
            
            
        case "÷":
            if(labelDown.text != ""){
                
                if(labelDown.text == "Error"){
                    return
                }
                
                //function LabelDownPoint helps to check if the value of input is "9." and then we click operator button
                // so in conditions like these value should be converted to "9"
                m_point = LabelDownPoint(label: m_operand1)
                if(m_point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                
                // perform the operation in the case
                // the case is executed having the value of operator
                switch (m_operator){
                    
                case "+":
                    
                    // statement is called if operand contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double + m_input1_double)
                    }
                        
                    else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int + m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "-":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double - m_input1_double)
                    }
                        
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int - m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "×":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double * m_input1_double)
                    }
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int * m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "÷":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    //function Dot postion checks for the rounding of output to the how many decimal places.
                    // This function gives the Integer value for decimal places to round off.
                    m_input1_double = Double (m_operand1)!
                    m_input2_double = Double (m_operand2)!
                    
                    //UI is updated
                    labelUp.text = String(format: "%.3f",m_input2_double / m_input1_double)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                    
                case "%":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.3f", (m_input2_double.truncatingRemainder(dividingBy:m_input1_double)))
                    }else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int.truncatingRemainder(dividingBy:m_input1_int))
                        
                    }
                    
                    //UI is updated
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
            
            
            
            /*
             Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****
             Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****
             Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****Remainder*****
             */
            
            
            
        case "%":
            if(labelDown.text != ""){
                
                if(labelDown.text == "Error"){
                    return
                }
                
                //function LabelDownPoint helps to check if the value of input is "9." and then we click operator button
                // so in conditions like these value should be converted to "9".
                m_point = LabelDownPoint(label: m_operand1)
                if(m_point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                
                // perform the operation in the case
                // the case is executed having the value of operator
                switch (m_operator){
                    
                case "+":
                    
                    // statement is called if operand contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double + m_input1_double)
                    }
                        
                    else{
                        
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int + m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "-":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double - m_input1_double)
                    }
                        
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int - m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "×":
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        m_position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(m_position)f",m_input2_double * m_input1_double)
                    }
                    else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int * m_input1_int)
                    }
                    
                    //UI is updated
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                case "÷":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    //function Dot postion checks for the rounding of output to the how many decimal places.
                    // This function gives the Integer value for decimal places to round off.
                    
                    m_input1_double = Double (m_operand1)!
                    m_input2_double = Double (m_operand2)!
                    
                    //UI is updated
                    labelUp.text = String(format: "%.3f",m_input2_double / m_input1_double)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                    
                    
                    
                case "%":
                    
                    if(!m_operand1.contains("1") && !m_operand1.contains("2") && !m_operand1.contains("3") && !m_operand1.contains("4") && !m_operand1.contains("5") && !m_operand1.contains("6") &&
                        !m_operand1.contains("7") && !m_operand1.contains("8") && !m_operand1.contains("9")){
                        labelDown.text = "Error"
                        m_operand1 = "0"
                        m_operand2 = "0"
                        m_operator = "0"
                        labelMid.text = ""
                        labelUp.text = ""
                        return
                    }
                    
                    // statement is called if operands contains decimal values
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        
                        //function Dot postion checks for the rounding of output to the how many decimal places.
                        // This function gives the Integer value for decimal places to round off.
                        
                        m_input1_double = Double (m_operand1)!
                        m_input2_double = Double (m_operand2)!
                        labelUp.text = String(format: "%.3f", (m_input2_double.truncatingRemainder(dividingBy:m_input1_double)))
                    }else{
                        // this statement is executed if operands does not have decimal values.
                        m_input1_int = Double (m_operand1)!
                        m_input2_int = Double (m_operand2)!
                        labelUp.text = String(format: "%.0f",m_input2_int.truncatingRemainder(dividingBy:m_input1_int))
                        
                    }
                    
                    //UI is updated
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
            
            
        // This statement is called to clear the last digit of operand and show the new operand.
        case"C":
            
            if(labelDown.text == "Error"){
                labelDown.text = "0"
                return
            }
            
            //This statement tells if the operand have negative integer than execute and drop the last digit.
            if(labelDown.text!.contains("-")){
                m_operand1 = String (m_operand1.dropLast())
                if(m_operand1.count == 1){
                    if(labelUp.text!.count>0){
                        labelDown.text = ""
                        m_operand1 = "0"
                        return
                    }
                    else{
                        m_operand1 = "0"
                    }
                }
                labelDown.text = m_operand1
                
                //This statement tells if the operand have non-negative integer than execute and drop the last digit.
            }else{
                m_operand1 = String (m_operand1.dropLast())
                if(m_operand1.count == 0){
                    if(labelUp.text!.count>0){
                        labelDown.text = ""
                        m_operand1 = "0"
                        return
                    }
                    else{
                        m_operand1 = "0"
                    }
                }
                labelDown.text = m_operand1
            }
            break
            
        // This statement just clears the expression.
        case"CE":
            m_operand1 = "0"
            labelDown.text = "0"
            labelUp.text = ""
            m_operator = ""
            m_operand2 = "0"
            labelMid.text = ""
            break
            
        //This statement makes the non-negative expression to negative and vice-versa.
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
            
            
            
        //This statement is called when the number buttons 0,1,2,3,4,5,6,7,8 and 9 is clicked. Then statement is executed.
        default:
            if(!labelDown.text!.contains(".")){
            m_length = Length(label: labelDown.text!)
            if(m_length < 12){
                if(m_operand1 == "0"){
                    m_operand1 = calculatorButton!
                }
                else{
                    m_operand1 += calculatorButton!
                }
                labelDown.text  = m_operand1
            
                }
                
            }
            else{
                if(m_operand1 == "0"){
                    m_operand1 = calculatorButton!
                }
                else{
                    m_operand1 += calculatorButton!
                }
                labelDown.text  = m_operand1
                
            }
        }
        
    }
    
    
    
    //function Dot postion checks for the rounding of output to the how many decimal places.
    // This function gives the Integer value for decimal places to round off.
    func DotPosition(oper1:String, oper2:String) -> Int {
        var dot1_positionFromFront = 0
        if(oper1.contains(".")){
            for cha1 in oper1 {
                dot1_positionFromFront += 1
                if(cha1 == "."){
                    break
                }
            }
        }
        var dot2_positionFromFront = 0
        if(oper2.contains(".")  ){
            for cha2 in oper2 {
                dot2_positionFromFront += 1
                if(cha2 == "."){
                    break
                }
            }
        }
        var dot1_positionfromEnd = 0
        if(dot1_positionFromFront != 0){
            dot1_positionfromEnd = oper1.count - dot1_positionFromFront
        }
        
        var dot2_positionfromEnd = 0
        if(dot2_positionFromFront != 0){
            dot2_positionfromEnd = oper2.count - dot2_positionFromFront
        }
        
        if(dot1_positionfromEnd >= dot2_positionfromEnd){
            return dot1_positionfromEnd
        }
        else{
            return dot2_positionfromEnd
        }
        
    }
    
    //function Dot postion checks for the rounding of output to the how many decimal places.
    // This function gives the Integer value for decimal places to round off.
    func DotPositionForMutiply(oper1:String, oper2:String) -> Int {
        var dot1_positionFromFront = 0
        if(oper1.contains(".")){
            for cha1 in oper1 {
                dot1_positionFromFront += 1
                if(cha1 == "."){
                    break
                }
            }
        }
        var dot2_positionFromFront = 0
        if(oper2.contains(".")  ){
            for cha2 in oper2 {
                dot2_positionFromFront += 1
                if(cha2 == "."){
                    break
                }
            }
        }
        var dot1_positionfromEnd = 0
        if(dot1_positionFromFront != 0){
            dot1_positionfromEnd = oper1.count - dot1_positionFromFront
        }
        
        var dot2_positionfromEnd = 0
        if(dot2_positionFromFront != 0){
            dot2_positionfromEnd = oper2.count - dot2_positionFromFront
        }
        
        return dot1_positionfromEnd + dot2_positionfromEnd
        
    }
    
    //function LabelDownPoint helps to check if the value of input is "9." and then we click operator button
    // so in conditions like these value should be converted to "9"
    func LabelDownPoint(label : String) -> Int {
        var dot1_positionFromFront = 0
        if(label.contains(".")){
            for cha1 in label {
                dot1_positionFromFront += 1
                if(cha1 == "."){
                    break
                }
            }
            
            return label.count - dot1_positionFromFront
        }
        return -1
    }
    
    func Length(label : String) -> Int {
        var labelLength = 0
        for cha in label {
            labelLength += 1
            if( cha == "."){
                return labelLength
            }
            
        }
        
        return labelLength
    }
    
    
}
