//
//  LayoutButtons.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 29/07/2021.
//

import UIKit
//Subview represents buttons stack
class ButtonsLayout: UIStackView {

    enum Style {
        case first, second, third
    }
    
    var style: Style = .second {
        didSet {
            setStyle(style)
        }
    }
    
    private var buttons: [UIButton] {
        var array: [UIButton] = []
        for button in arrangedSubviews {
            array.append(button as! UIButton)
        }
        return array
    }
    
    private func setStyle(_ style: Style) {
        unselectButtons()
        switch style {
        case .first:
            buttons[0].isSelected = true
        case .second:
            buttons[1].isSelected = true
        case .third:
            buttons[2].isSelected = true
        }
    }
    
    private func unselectButtons() {
        for button in buttons {
            button.isSelected = false
        }
    }
    
}
