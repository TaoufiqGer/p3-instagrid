//
//  ViewController.swift
//  Instagrid
//
//  Created by Taoufiq Germoud on 27/06/2021.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
        } else {
            label.text = "Swipe left to share"
        }
    }
    
    
    @IBOutlet weak var images: LayoutGrid!
    @IBOutlet weak var buttons: LayoutButtons!
    
    
    @IBOutlet var imagesArray: [UIImageView]!
    
    
    @IBAction func firstLayout(_ sender: UIButton) {
        buttons.style = .first
        images.style = .first
    }
    
    @IBAction func secondLayout(_ sender: UIButton) {
        buttons.style = .second
        images.style = .second
    }
    
    @IBAction func thirdLayout(_ sender: UIButton) {
        buttons.style = .third
        images.style = .third
    }
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func addImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                    print("Button capture")

                    imagePicker.delegate = self
                    imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = false

                    present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
            self.dismiss(animated: true, completion: { () -> Void in

            })

        imagesArray[0].image = image
    }
}

