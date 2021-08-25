//
//  LayoutEngine.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 05/08/2021.
//

import Foundation
import UIKit

/// This class acts as an engine for the grid layout
class LayoutEngine {
    
    /// Array of pictures added to the grid
    private var pictures: [UIImage] = [UIImage(), UIImage(), UIImage(), UIImage()]
    
    /// Index of the picture that the user is adding
    var currentIndex = 0
    
    var currentImage: UIImage {
        return pictures[currentIndex]
    }
    
    /// Adds picture to the array
    /// - Parameter picture: picture that has been chosen by the user
    func addPicture(picture: UIImage) {
        //pictures.append(picture)
        pictures[currentIndex] = picture
        // add picture at current index
    }
    
    /// Removes all pictures
    func clearPictures() {
        pictures = [UIImage(), UIImage(), UIImage(), UIImage()]
    }
    
    /// Sends a notification to the ViewController once the model has changed
    func refresh() {
        let notificationName = Notification.Name(rawValue: "PicturesLoaded")
        let notification = Notification(name: notificationName)
        NotificationCenter.default.post(notification)
    }
}
