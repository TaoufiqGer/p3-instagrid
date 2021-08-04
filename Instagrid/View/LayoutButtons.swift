//
//  LayoutButtons.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 29/07/2021.
//

import UIKit

class LayoutButtons: UIStackView {

        
    enum Style {
        case first, second, third
    }
    
    var style: Style = .second {
        didSet {
            setStyle(style)
        }
    }
    
    private var buttons: [UIButton] = []
    
    private func setStyle(_ style: Style) {
        
        for button in arrangedSubviews {
            buttons.append(button as! UIButton)
        }
        
        switch style {
        case .first:

            buttons[0].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
            buttons[1].setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
            buttons[2].setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        case .second:

            buttons[0].setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
            buttons[1].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
            buttons[2].setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        case .third:

            buttons[0].setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
            buttons[1].setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
            buttons[2].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
        }
    }
    
}
