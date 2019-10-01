/*
 * AppDelegate.swift
 * Project: Calculator
 * Name: Simranjeet Singh Dhillon
 * StudentID: 301093914
 * Version: V9 - Issue resolved in rounding off value
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
                var point = LabelDownPoint(label: m_operand1)
                if(point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",a + b)
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
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b - a)
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
                        var position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",a * b)
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
                    var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
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
                var point = LabelDownPoint(label: m_operand1)
                if(point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                    labelDown.text = m_operand1
                }
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(format: "%.\(position)f",a + b)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelDown.text = String(a + b)
                    }
                    break
                    
                case "-":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(format: "%.\(position)f",b - a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelDown.text = String(b - a)
                    }
                    
                    break
                case "×":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(format: "%.\(position)f",b * a)
                    }else{
                        var a = Int64 (m_operand1)!
                        var b = Int64 (m_operand2)!
                        labelDown.text = String(b * a)
                    }
                    break
                case "÷":
                    var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelDown.text = String(format: "%.2f",b / a)
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelDown.text = String(format: "%.2f", (b.truncatingRemainder(dividingBy:a)))
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
                var point = LabelDownPoint(label: m_operand1)
                if(point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",a + b)
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
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b - a)
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
                        var position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b * a)
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
                    var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
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
                var point = LabelDownPoint(label: m_operand1)
                if(point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",a + b)
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
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b - a)
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
                        var position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b * a)
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
                    var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
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
                var point = LabelDownPoint(label: m_operand1)
                if(point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",a + b)
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
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b - a)
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
                        var position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b * a)
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
                    var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
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
                var point = LabelDownPoint(label: m_operand1)
                if(point == 0){
                    m_operand1 = String(m_operand1.dropLast())
                }
                switch (m_operator){
                case "+":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",a + b)
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
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b - a)
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
                        var position = DotPositionForMutiply(oper1: m_operand1, oper2: m_operand2)
                        var a = Double (m_operand1)!
                        var b = Double (m_operand2)!
                        labelUp.text = String(format: "%.\(position)f",b * a)
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
                    var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
                    var a = Double (m_operand1)!
                    var b = Double (m_operand2)!
                    labelUp.text = String(format: "%.2f",b / a)
                    m_operand2 = labelUp.text!
                    m_operand1 = "0"
                    labelDown.text = ""
                    break
                case "%":
                    if(m_operand1.contains(".") || m_operand2.contains(".")){
                        var position = DotPosition(oper1: m_operand1, oper2: m_operand2)
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
    
    func LabelDownPoint(label : String) -> Int {
        var dot1_positionFromFront = 0
        if(label.contains(".")){
            for cha1 in label {
                dot1_positionFromFront += 1
                if(cha1 == "."){
                    break
                }
            }
            
            var dot1_positionfromEnd = label.count - dot1_positionFromFront
            return dot1_positionfromEnd
        }
        return -1
    }
    
    
}
