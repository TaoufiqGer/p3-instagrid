//
//  ViewController.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 27/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var gridLayout: GridLayout!
    @IBOutlet weak var buttonsLayout: ButtonsLayout!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet var addImageButtons: [UIButton]!
    
    private var layoutEngine = LayoutEngine()
    /// This tracks the current add button
    private var currentAddButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsLayout.style = .second
        gridLayout.style = .second
                
        let picturesLoadedNotification = Notification.Name(rawValue: "PicturesLoaded")
        NotificationCenter.default.addObserver(self, selector: #selector(picturesLoaded), name: picturesLoadedNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDeviceRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @IBAction func swipeUpTransform(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait {
            animateAndShare(with: sender)
        }
    }
    @IBAction func swipeLeftTransform(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape {
            animateAndShare(with: sender)
        }
    }
    
    /// This function launches the animation when a user performs a swipe on the screen and calls the share function
    private func animateAndShare(with gesture: UISwipeGestureRecognizer) {
        
        var translationTransform: CGAffineTransform
        
        if gesture.direction == .up {
            translationTransform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
        } else {
            translationTransform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
                        self.gridLayout.transform = translationTransform }) { _ in
            self.share()
            self.removeImages()
        }
    }
    
    private func removeImages() {
        for image in images {
            image.image = nil
            /// using tags to access associated add button
            addImageButtons[image.tag].isHidden = false
        }
        /// remove pictures from the model/DB as well
        layoutEngine.clearPictures()
    }
    
    /// Share the picture
    private func share() {
        let imageToShare = gridLayout.toImage()
        let activityViewController =
            UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
        activityViewController.completionWithItemsHandler = {
            (activity, success, items, error) in
            var translationTransform: CGAffineTransform
            translationTransform = CGAffineTransform(translationX: 0, y: 0)
            UIView.animate(withDuration: 2.3, animations: {
                            self.gridLayout.transform = translationTransform })
                }
        present(activityViewController, animated: true)
    }
    
    /// Change the grid layout and start with an empty grid
    @IBAction func changeLayout(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            buttonsLayout.style = .first
            gridLayout.style = .first
        case 2:
            buttonsLayout.style = .second
            gridLayout.style = .second
        default:
            buttonsLayout.style = .third
            gridLayout.style = .third
        }
        removeImages()
    }
    
    /// This function manages the adding of a picture workflow
    @IBAction func addImage(_ sender: UIButton) {
        /// using the tag of the button as the current index
        layoutEngine.currentIndex = sender.tag
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        currentAddButton = sender
    }
    
    /// This function will add an image to the view from the model
    @objc func picturesLoaded() {
        //images[layoutEngine.currentIndex].image = layoutEngine.currentImage
        for image in images {
            if image.tag == layoutEngine.currentIndex {
                image.image = layoutEngine.currentImage
            }
        }
    }
    
    @objc func onDeviceRotated() {
        if UIDevice.current.orientation.isPortrait {
            swipeLabel.text = "Swipe up to share"
            
        } else {
            swipeLabel.text = "Swipe left to share"
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// imagePicker controller manages the picking of an image process
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            /// Adds the image to the model / Data persistence
            layoutEngine.addPicture(picture: image)
            /// Sends a notification to update the view
            layoutEngine.refresh()
        }
        /// Hide the + sign on the picture
        currentAddButton.isHidden = true
        
    }
    
    /// This function manages when the user cancel the picking process
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
}
