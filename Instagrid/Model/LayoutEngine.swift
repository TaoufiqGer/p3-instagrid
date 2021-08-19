//
//  LayoutEngine.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 05/08/2021.
//

import Foundation
import UIKit

class LayoutEngine {
    private var pictures: [UIImage] = []
        
    var currentIndex = 0
    
    var currentImage: UIImage {
        return pictures[currentIndex]
    }
        
    func addPicture(picture: UIImage) {
        pictures.append(picture)
    }
    func clearPictures() {
        self.pictures = []
    }
    
    func refresh() {
        let notificationName = Notification.Name(rawValue: "PicturesLoaded")
        let notification = Notification(name: notificationName)
        NotificationCenter.default.post(notification)
    }
}
