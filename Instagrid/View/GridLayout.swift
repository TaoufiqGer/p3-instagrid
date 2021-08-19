//
//  LayoutGrid.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 02/08/2021.
//

import UIKit

class GridLayout: UIStackView {
    
    @IBOutlet private var bottomRow: UIStackView!
    @IBOutlet private var upperRow: UIStackView!

    
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
            bottomRow.arrangedSubviews[1].isHidden = false
        case .second:
            upperRow.arrangedSubviews[0].isHidden = false
            bottomRow.arrangedSubviews[1].isHidden = true
        case .third:
            upperRow.arrangedSubviews[0].isHidden = false
            bottomRow.arrangedSubviews[1].isHidden = false
        }
    }
    
}

extension GridLayout {
    func toImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
