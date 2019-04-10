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
        do {
            let lexer = BasicLearnLexer(ANTLRInputStream(codeView.text!))
            let tokens = CommonTokenStream(lexer)
            let parser = try BasicLearnParser(tokens)
            let tree = try parser.program()
            let walker = ParseTreeWalker()
            print(tree)
            print(walker)
        } catch {
            print("Parse error: \(error.localizedDescription)")
        }
    }
    
}

