//
//  ViewController.swift
//  ProtocolApp
//
//  Created by Артем Пашевич on 17.08.22.
//

import UIKit

protocol SendBC: AnyObject {
    func update(any : Color)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        
    }
    
    var color : Color?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc2 = segue.destination as? SecondVC else { return }
        vc2.delegate = self
       vc2.colorBCFromFirstVC = color
    }
    
}

extension ViewController: SendBC {
    func update(any: Color) {
        color = Color(r: any.r, g: any.g, b: any.b, a: any.a)
        self.view.backgroundColor = UIColor(red: CGFloat(any.r), green: CGFloat(any.g), blue: CGFloat(any.b), alpha: CGFloat(any.a))
    }
    
   
    
}
    

