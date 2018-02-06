//
//  CapturedImageView.swift
//  CustomCameraCaptureSession
//
//  Created by Vikash Hart on 2/6/18.
//  Copyright © 2018 Vikash Hart. All rights reserved.
//

import UIKit

class CapturedImageView: UIView {
    
    lazy var cancelButton: UIButton = {
        let cancel = UIButton()
        cancel.setTitle("Cancel", for: .normal)
        cancel.setTitleColor(.red, for: .normal)
        return cancel
    }()
    
    lazy var saveButton: UIButton = {
        let save = UIButton()
        save.setTitle("Save", for: .normal)
        save.setTitleColor(.green, for: .normal)
        return save
    }()
    
        
    // Implement this var if you want to implement a "use" button, or if you want to create a new button that you can modify that wil appear in the top right side of the view across from the cancel button.
    
//    lazy var useButton: UIButton = {
//        let use = UIButton()
//        use.setTitle("Use", for: .normal)
//        use.setTitleColor(.green, for: .normal)
//        return use
//    }()
    
    lazy var imagePreviewView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var headerView: UIView = {
        let header = UIView()
        header.layer.opacity = 0.6
        header.backgroundColor = .black 
        return header
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupHeaderView()
        setupImagePreviewView()
        setupCancelButton()
        setupSaveButton()
        // Use the below function if you want to set up the "use" button.
        //setupUseButton()
    }
    
    private func setupHeaderView(){
        addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            headerView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
    
    private func setupImagePreviewView(){
        addSubview(imagePreviewView)
        imagePreviewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePreviewView.topAnchor.constraint(equalTo: topAnchor),
            imagePreviewView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagePreviewView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagePreviewView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imagePreviewView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagePreviewView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    
    private func setupCancelButton(){
        addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            cancelButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            ])
    }
    
    private func setupSaveButton(){
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            saveButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])
    }
    
    //NOTE:- Use these constraints if you want to implement the use button or a new button. It will appear in the top right side of the view.
    
//    private func setupUseButton(){
//        addSubview(useButton)
//        useButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            useButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
//            useButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
//            ])
//    }
    
}

