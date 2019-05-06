//
//  ViewController.swift
//  BasicLearnIDE
//
//  Created by Mauricio Garza on 4/10/19.
//  Copyright © 2019 Mauricio Garza. All rights reserved.
//

import UIKit
import Antlr4

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var codeView: UITextView!
    @IBOutlet weak var outputView: UITextView!
    
    @IBAction func compile(_ sender: UIButton) {
        cleanOutput()
        let compiler = MainCompiler()
        compiler.execute(code: codeView.text!, viewController: self)
    }
    
    func updateOutput(outputs : [String]) {
        for out in outputs {
            print(out)
            outputView.text += "\(out)\n"
        }
    }
    
    func cleanOutput() {
        outputView.text = ""
    }
}

