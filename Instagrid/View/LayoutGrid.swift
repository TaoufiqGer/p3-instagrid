//
//  LayoutGrid.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 02/08/2021.
//

import UIKit

class LayoutGrid: UIStackView {

    @IBOutlet private var imageStack: UIStackView!
    
    enum Style {
        case first, second, third
    }
    
    var style: Style = .second {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        
        /*var buttons: [UIButton] = []
        
        for button in buttonStack.arrangedSubviews {
            buttons.append(button as! UIButton)
        }*/
        
        switch style {
        case .first:
            imageStack.arrangedSubviews[0].isHidden = true
            imageStack.arrangedSubviews[0].isHidden = false
            imageStack.arrangedSubviews[1].isHidden = false
        case .second:
            imageStack.arrangedSubviews[0].isHidden = false
            imageStack.arrangedSubviews[1].isHidden = false
            imageStack.arrangedSubviews[0].isHidden = true
        case .third:
            imageStack.arrangedSubviews[0].isHidden = false
            imageStack.arrangedSubviews[1].isHidden = false
            imageStack.arrangedSubviews[0].isHidden = false
            imageStack.arrangedSubviews[1].isHidden = false
        }
    }
    
}
