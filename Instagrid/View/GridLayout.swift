//
//  LayoutGrid.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 02/08/2021.
//

import UIKit

/// Subview that represents the grid in the center of the main view
class GridLayout: UIStackView {
    
    /// The bottom row of the grid
    @IBOutlet private var bottomRow: UIStackView!
    /// The upper row of the grid
    @IBOutlet private var upperRow: UIStackView!

    /// GridLayout can have three different styles
    enum Style {
        case first, second, third
    }
    
    var style: Style = .second {
        didSet {
            setStyle(style)
        }
    }
    
    /// This function changes the grid layout depending on style
    /// - Parameter style: Style of the layout
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
    /// converts a UIView into UIImage
    /// - Returns: UIImage of the LayoutGrid
    func toImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
