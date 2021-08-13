//
//  LayoutEngine.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 05/08/2021.
//

import Foundation
import UIKit

class LayoutEngine {
    var pictures: [UIImage] = [UIImage(),UIImage(),UIImage(),UIImage()] //[NIL, ...]
    var currentImage = 0
    
    func refresh() {
        let name = Notification.Name(rawValue: "PicturesLoaded")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }
    
}
