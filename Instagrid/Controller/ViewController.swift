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

    private var layoutEngine = LayoutEngine()
    private var selectedLayoutButton: UIButton = UIButton()
    // The picture that the user is adding currently and the last one added
    private var currentPicture = UIImage()

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
    
    private func animateAndShare(with gesture: UISwipeGestureRecognizer) {
        
        var translationTransform: CGAffineTransform
        
        if gesture.direction == .up {
            translationTransform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
        } else if gesture.direction == .left {
            translationTransform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        } else {
            translationTransform = CGAffineTransform(translationX: 0, y: 0)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
                        self.gridLayout.transform = translationTransform }) { _ in
            self.share()
            self.removeImages()
            translationTransform = CGAffineTransform(translationX: 0, y: 0)
            UIView.animate(withDuration: 2.3, animations: {
                            self.gridLayout.transform = translationTransform })
        }
    }
    private func removeImages() {
        for image in images {
            image.image = nil
            image.superview?.subviews[1].isHidden = false
        }
        layoutEngine.clearPictures()
    }
    private func share() {
        let imageToShare = gridLayout.toImage()
        let activityViewController =
            UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
        present(activityViewController, animated: true)
    }
    
    @IBAction func firstLayout(_ sender: UIButton) {
        removeImages()
        buttonsLayout.style = .first
        gridLayout.style = .first
    }
    
    @IBAction func secondLayout(_ sender: UIButton) {
        removeImages()
        buttonsLayout.style = .second
        gridLayout.style = .second
    }
    
    @IBAction func thirdLayout(_ sender: UIButton) {
        removeImages()
        buttonsLayout.style = .third
        gridLayout.style = .third
    }
        
    @IBAction func addImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        //I'm using tags
        layoutEngine.currentIndex = sender.tag - 1
        selectedLayoutButton = sender
    }
    
    @objc func picturesLoaded() {
        images[layoutEngine.currentIndex].image = currentPicture

    }
    
    /*func layoutChanged() {
        var c = 0
        switch buttonsLayout.style {
        case .first:
            images[c].image = nil
            for i in layoutEngine.pictures {
                print("toto")
                images[c+1].image = i
                c += 1
            }
        default:
            for i in layoutEngine.pictures {
                images[c].image = i
            }
        }
    }*/
    
    @objc func onDeviceRotated() {
        if UIDevice.current.orientation.isPortrait {
            swipeLabel.text = "Swipe up to share"
            
        } else if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = "Swipe left to share"
            print(UIDevice.current.orientation.rawValue)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            currentPicture = image
            layoutEngine.addPicture(picture: image)
            layoutEngine.refresh()
        }
        selectedLayoutButton.isHidden = true
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
