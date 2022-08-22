//
//  SecondVC.swift
//  ProtocolApp
//
//  Created by Артем Пашевич on 17.08.22.
//

import UIKit

class SecondVC: UIViewController {

    
    @IBOutlet weak var greenSldr: UISlider!
    
    @IBOutlet weak var greenTxtFld: UITextField!
    
    @IBOutlet weak var redSldr: UISlider!
    
    @IBOutlet weak var redTxtFld: UITextField!
    
    @IBOutlet weak var blueSldr: UISlider!
    
    @IBOutlet weak var blueTxtFld: UITextField!
    
    @IBOutlet weak var hexColor: UITextField!
    
    @IBOutlet weak var preview: UIView!
    
    @IBOutlet weak var alfaSldr: UISlider!
    
    @IBOutlet weak var alfaTxtFld: UITextField!
    
    
    weak var delegate: SendBC?
    var colorBCFromFirstVC: Color?
    
    
    @IBAction func doneBtn(_ sender: Any) {
        
        
    }
    
    
    
    @IBAction func actionSldrRed(_ sender: Any) {
        changeColor()
    }
    
    
    
    @IBAction func actionSldrGreen(_ sender: Any) {
        changeColor()
    }
    
    
    @IBAction func actionSldrBlue(_ sender: Any) {
        changeColor()
    }
    
    
    @IBAction func actionSldrAlfa(_ sender: Any) {
        changeColor()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func changeColor() {
        getBCFromFirstVC()
        colorPrewiew()
        textFldColorNumber()
        setHexField()
    }

    func colorPrewiew() {
        let red = redSldr.value
        let blue = blueSldr.value
        let green = greenSldr.value
        let alfa = alfaSldr.value
        preview.layer.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alfa)).cgColor
        let color = Color(r: redSldr.value, g: greenSldr.value, b: blueSldr.value, a: alfaSldr.value)
        delegate?.update(any: color)
    }
    
    func textFldColorNumber() {
        redTxtFld.text = String(redSldr.value)
        greenTxtFld.text = String(greenSldr.value)
        blueTxtFld.text = String(blueSldr.value)
        alfaTxtFld.text = String(alfaSldr.value)
    }
    
    func setHexField() {
        let red = redSldr.value
        let green = greenSldr.value
        let blue = blueSldr.value
        let alpha = alfaSldr.value
        let hex = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha)).toHexString()
        hexColor.text = hex
    }
    
    func getBCFromFirstVC () {
        if let colorBCFromFirstVC = colorBCFromFirstVC {
            redSldr.value = colorBCFromFirstVC.r
            greenSldr.value = colorBCFromFirstVC.g
            blueSldr.value = colorBCFromFirstVC.b
            alfaSldr.value = colorBCFromFirstVC.a
            preview.layer.backgroundColor = UIColor(red: CGFloat(redSldr.value), green: CGFloat(greenSldr.value), blue: CGFloat(blueSldr.value), alpha: CGFloat(alfaSldr.value)).cgColor
        }
        
    }
    
}

struct Color {
    let r: Float
    let g: Float
    let b: Float
    let a: Float
}
