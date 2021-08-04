//
//  LayoutGrid.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 02/08/2021.
//

import UIKit

class LayoutGrid: UIStackView {

    @IBOutlet private var upperRow: UIStackView!
    @IBOutlet private var bottomRow: UIStackView!
    
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
            upperRow.arrangedSubviews[0].isHidden = true
            bottomRow.arrangedSubviews[0].isHidden = false
            bottomRow.arrangedSubviews[1].isHidden = false
        case .second:
            upperRow.arrangedSubviews[0].isHidden = false
            upperRow.arrangedSubviews[1].isHidden = false
            bottomRow.arrangedSubviews[0].isHidden = true
        case .third:
            upperRow.arrangedSubviews[0].isHidden = false
            upperRow.arrangedSubviews[1].isHidden = false
            bottomRow.arrangedSubviews[0].isHidden = false
            bottomRow.arrangedSubviews[1].isHidden = false
        }
    }
    
}
