//
//  ViewController.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 27/06/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var layoutButtons: LayoutButtons!
    
    @IBAction func firstLayout(_ sender: UIButton) {
        layoutButtons.style = .first
    }
    
    @IBAction func secondLayout(_ sender: UIButton) {
        layoutButtons.style = .second
    }
    
    @IBAction func thirdLayout(_ sender: UIButton) {
        layoutButtons.style = .third
    }
}

