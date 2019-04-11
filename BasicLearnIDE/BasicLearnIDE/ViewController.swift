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
    
    @IBAction func compile(_ sender: UIButton) {
        let compiler = MainCompiler()
        compiler.execute(code: codeView.text!)
    }
    
}

