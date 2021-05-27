//
//  ViewController.swift
//  Camera
//
//  Created by period6 on 5/19/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let pickerController = UIImagePickerController.self
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
       
     
    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
        openCamera()
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image", "public.movie"]
        pickerController.sourceType = .camera
    }
  
    @IBAction func photoLibrary(_ sender: Any) {
        openGallary()
        UIImageView()
    }
    func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
       let pickerController = UIImagePickerController.SourceType.camera
            self .present( UIViewController(), animated: true, completion: nil)
        }
       
        else {
            UIAlertController(title: "Warning", message: "You Need A Camera", preferredStyle: .alert)
          
        }
    }
    func openGallary() {
        UIImagePickerController.SourceType.photoLibrary
        self.present( UIViewController(), animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            pictureImageView.image = image
            self.dismiss(animated: true, completion: nil)
        }

}
