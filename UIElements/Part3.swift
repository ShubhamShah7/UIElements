//
//  Part3.swift
//  UIElements
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part3: UIViewController {
    
    private let toolBar:UIToolbar = {
        let tBar = UIToolbar()
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelCalled))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: #selector(spacerManage))
        let camera = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        tBar.items = [cancel,spacer,camera]
        return tBar
    }()
    
    private let img:UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "1")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let imagePicker:UIImagePickerController = {
       let picker = UIImagePickerController()
        picker.allowsEditing = false
        return picker
    }()
    
    @objc func spacerManage(){}
    @objc func handleGallery(){
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    
    @objc func cancelCalled()
    {
        self.dismiss(animated: true)
    }
    
    private let pageControl:UIPageControl = {
        let pg = UIPageControl()
        pg.currentPageIndicatorTintColor = .white
        pg.backgroundColor = .red
        pg.numberOfPages = 0
        pg.currentPage = 2
        return pg
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        title = "Upload Image"
        view.addSubview(img)
        view.addSubview(toolBar)
        view.addSubview(pageControl)
        imagePicker.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 100
        toolBar.frame = CGRect(x:0, y:0, width: view.width, height: toolBarHeight)
        img.frame = CGRect(x:20,y: toolBar.bottom+20,width: view.width - 40,height: 170)
        pageControl.frame = CGRect(x:20, y:img.bottom+150, width: view.width-40, height: 40)
    }
}

extension Part3 : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImg = info[.originalImage] as? UIImage {
            img.image = selectedImg
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
