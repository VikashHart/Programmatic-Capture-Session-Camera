//
//  PreviewViewController.swift
//  CustomCameraCaptureSession
//
//  Created by Vikash Hart on 2/6/18.
//  Copyright © 2018 Vikash Hart. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    
    let photoPreview = CapturedImageView()
    
    //MARK:- Variables
    
    //Here we force unwrap because the only way to make it to this viewController is to have an actual image to pass into here after taking a photo.
    var image: UIImage!
    
    //MARK:- ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // You must add the instance of the subview, eg. "imagePreview" for it to show up on the device.
        view.addSubview(photoPreview)
        photoPreview.cancelButton.addTarget(self,
                                            action: #selector(cancel),
                                            for: .touchUpInside)
        
        photoPreview.saveButton.addTarget(self,
                                          action: #selector(save),
                                          for: .touchUpInside)
        
        // Use this button target if you want to implement the use button, or any button that you want to turn it into.
//        imagePreview.useButton.addTarget(self,
//                                         action: #selector(use),
//                                         for: .touchUpInside
//        )
        
        photoPreview.imagePreviewView.image = image
    }
    
    // This initalizer is needed so that this viewController can take in an instance of the image you just took, eg. "var image: UIImage!".
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.image = image
    }
    
    // This is also mandatory if you implement the custom initializer above.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Functions
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func save() {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    //NOTE:- !!!WARNING!!! In order to use this function you must disable, move or delete the "saveButton", its constraints, and its target action because this button is in the same place as the saveButton.
    
    // Use this function below if you have another viewController that you want to pass the image you took to, eg. "NewViewController". Just create an instance of the viewController that you want to pass the image to, eg. "newVC". You must also set the parameters for the image you are passing to the new viewController in the viewController's initializer, eg. "let newVC = NewViewController "This!: --> (image: image) <--""
    
//    @objc func use(){
//        let newVC = NewViewController(image: image)
//        present(newVC, animated: true, completion: nil)
//    }
    
    
}

