//
//  ViewController.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 27/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let picturesLoadedNotification = Notification.Name(rawValue: "PicturesLoaded")
        NotificationCenter.default.addObserver(self, selector: #selector(picturesLoaded), name: picturesLoadedNotification, object: nil)
        layoutEngine.refresh()
        NotificationCenter.default.addObserver(self, selector: #selector(onDeviceRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var gridLayout: GridLayout!
    @IBOutlet weak var buttonsLayout: ButtonsLayout!
    @IBOutlet var images: [UIImageView]!

    var layoutEngine = LayoutEngine()
    var currentButton: UIButton = UIButton()

    
    @IBAction func swipeUpTransform(_ sender: UISwipeGestureRecognizer) {
        transformGridView(with: sender)
    }
    
    @IBAction func swipeLeftTransform(_ sender: UISwipeGestureRecognizer) {
        transformGridView(with: sender)
    }
    
    private func transformGridView(with gesture: UISwipeGestureRecognizer) {
        
        var translationTransform: CGAffineTransform
        
        if gesture.direction == .up {
            translationTransform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
        } else {
            translationTransform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.gridLayout.transform = translationTransform }, completion: nil)
        
        share()
        
        translationTransform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 2.3, animations: {
                        self.gridLayout.transform = translationTransform }) {_ in
            // completion code here
        }
        // use Completion
        /*}) {
         // my code here
         }*/
        
    }
    
    private func share() {
        let activityViewController =
            UIActivityViewController(activityItems: images, applicationActivities: nil)

        present(activityViewController, animated: true)
    }
    
    @IBAction func firstLayout(_ sender: UIButton) {
        layoutEngine.pictures = []
        buttonsLayout.style = .first
        gridLayout.style = .first
    }
    
    @IBAction func secondLayout(_ sender: UIButton) {
        layoutEngine.pictures = []
        buttonsLayout.style = .second
        gridLayout.style = .second
    }
    
    @IBAction func thirdLayout(_ sender: UIButton) {
        layoutEngine.pictures = []
        buttonsLayout.style = .third
        gridLayout.style = .third
        
    }
        
    
    @IBAction func addImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        
        layoutEngine.currentImage = sender.tag - 1
        
        currentButton = sender
        
        
        /*layoutEngine.currentImage = sender.accessibilityElementCount()
        
        print(index(ofAccessibilityElement: sender))
        currentButton = sender*/
        
        //Add tags to buttons
        // OR
        
        
    }
    
    @objc func picturesLoaded() {
        images[layoutEngine.currentImage].image = layoutEngine.pictures[layoutEngine.currentImage]
    }
    
    @objc func onDeviceRotated() {
        if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
            
        } else {
            label.text = "Swipe left to share"
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            layoutEngine.pictures[layoutEngine.currentImage] = image
            //imagesArray[0].image = image
            layoutEngine.refresh()
            
        }
        currentButton.isHidden = true
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
