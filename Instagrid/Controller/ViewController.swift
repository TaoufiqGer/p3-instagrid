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

    @IBOutlet weak var topRow: UIStackView!
    @IBOutlet weak var buttomRow: UIStackView!
    
    @IBAction func firstLayout(_ sender: UIButton) {
        topRow.arrangedSubviews[0].isHidden = true
        buttomRow.arrangedSubviews[0].isHidden = false
        buttomRow.arrangedSubviews[1].isHidden = false
    }
    
    @IBAction func secondLayout(_ sender: UIButton) {
        topRow.arrangedSubviews[0].isHidden = false
        topRow.arrangedSubviews[1].isHidden = false
        buttomRow.arrangedSubviews[0].isHidden = true
    }
    @IBAction func thirdLayout(_ sender: UIButton) {
        topRow.arrangedSubviews[0].isHidden = false
        topRow.arrangedSubviews[1].isHidden = false
        buttomRow.arrangedSubviews[0].isHidden = false
        buttomRow.arrangedSubviews[1].isHidden = false
    }
}

