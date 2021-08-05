//
//  ViewController.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 27/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
        } else {
            label.text = "Swipe left to share"
        }
        
        let name = Notification.Name(rawValue: "PicturesLoaded")
        NotificationCenter.default.addObserver(self, selector: #selector(picturesLoaded), name: name, object: nil)
    }
    
    var layoutEngine = LayoutEngine()

    @IBOutlet weak var images: LayoutGrid!
    @IBOutlet weak var buttons: LayoutButtons!
    
    
    @IBOutlet var imagesArray: [UIImageView]!
    
    
    @IBAction func firstLayout(_ sender: UIButton) {
        layoutEngine.pictures = []
        buttons.style = .first
        images.style = .first
    }
    
    @IBAction func secondLayout(_ sender: UIButton) {
        layoutEngine.pictures = []
        buttons.style = .second
        images.style = .second
    }
    
    @IBAction func thirdLayout(_ sender: UIButton) {
        layoutEngine.pictures = []
        buttons.style = .third
        images.style = .third
        
    }
    
    var currentButton: UIButton = UIButton()
    
    
    @IBAction func addImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        layoutEngine.currentImage = sender.accessibilityElementCount()
        currentButton = sender
    }
    
    @objc func picturesLoaded() {
        
        imagesArray[layoutEngine.currentImage].image = layoutEngine.pictures[layoutEngine.currentImage]
        
    }
        
    

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            layoutEngine.pictures[layoutEngine.currentImage] = image
        }
        currentButton.isHidden = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

