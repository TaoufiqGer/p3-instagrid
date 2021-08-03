//
//  LayoutButtons.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 29/07/2021.
//

import UIKit

class LayoutButtons: UIStackView {

    
    @IBOutlet private var buttonStack: UIStackView!
    
    enum Style {
        case first, second, third
    }
    
    var style: Style = .second {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        
        var buttons: [UIButton] = []
        
        for button in buttonStack.arrangedSubviews {
            buttons.append(button as! UIButton)
        }
        
        switch style {
        case .first:
            /*layoutGrid[0].arrangedSubviews[0].isHidden = true
            layoutGrid[1].arrangedSubviews[0].isHidden = false
            layoutGrid[1].arrangedSubviews[1].isHidden = false*/
            buttons[0].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
            buttons[1].setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
            buttons[2].setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        case .second:
            /*layoutGrid[0].arrangedSubviews[0].isHidden = false
            layoutGrid[0].arrangedSubviews[1].isHidden = false
            layoutGrid[1].arrangedSubviews[0].isHidden = true*/
            buttons[0].setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
            buttons[1].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
            buttons[2].setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        case .third:
            /*layoutGrid[0].arrangedSubviews[0].isHidden = false
            layoutGrid[0].arrangedSubviews[1].isHidden = false
            layoutGrid[1].arrangedSubviews[0].isHidden = false
            layoutGrid[1].arrangedSubviews[1].isHidden = false*/
            buttons[0].setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
            buttons[1].setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
            buttons[2].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
        }
    }
    
}
