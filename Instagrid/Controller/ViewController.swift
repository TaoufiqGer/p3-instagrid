//
//  ViewController.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 27/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
        } else {
            label.text = "Swipe left to share"
        }
    }
    
    
    @IBOutlet weak var images: LayoutGrid!
    @IBOutlet weak var buttons: LayoutButtons!
    
    
    @IBAction func firstLayout(_ sender: UIButton) {
        buttons.style = .first
        images.style = .first
    }
    
    @IBAction func secondLayout(_ sender: UIButton) {
        buttons.style = .second
        images.style = .second
    }
    
    @IBAction func thirdLayout(_ sender: UIButton) {
        buttons.style = .third
        images.style = .third
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
    }
    
}

