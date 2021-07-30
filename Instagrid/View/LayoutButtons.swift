//
//  LayoutButtons.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 29/07/2021.
//

import UIKit

class LayoutButtons: UIStackView {

    
    @IBOutlet var layoutGrid: [UIStackView]!
    @IBOutlet var layoutButton: [UIButton]!
    
    enum Style {
        case first, second, third
    }
    
    var style: Style = .second {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .first:
            layoutGrid[0].arrangedSubviews[0].isHidden = true
            layoutGrid[1].arrangedSubviews[0].isHidden = false
            layoutGrid[1].arrangedSubviews[1].isHidden = false
            layoutButton[0].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
            layoutButton[1].setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
            layoutButton[2].setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        case .second:
            layoutGrid[0].arrangedSubviews[0].isHidden = false
            layoutGrid[0].arrangedSubviews[1].isHidden = false
            layoutGrid[1].arrangedSubviews[0].isHidden = true
            layoutButton[0].setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
            layoutButton[1].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
            layoutButton[2].setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        case .third:
            layoutGrid[0].arrangedSubviews[0].isHidden = false
            layoutGrid[0].arrangedSubviews[1].isHidden = false
            layoutGrid[1].arrangedSubviews[0].isHidden = false
            layoutGrid[1].arrangedSubviews[1].isHidden = false
            layoutButton[0].setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
            layoutButton[1].setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
            layoutButton[2].setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
        }
    }
    
}
