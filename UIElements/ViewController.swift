//
//  ViewController.swift
//  UIElements
//
//  Created by DCS on 17/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let textview:UITextView = {
       let txt = UITextView()
        txt.text = "UIElements Assignment"
        txt.textAlignment = .center
        txt.textColor = .black
//        txt.backgroundColor = .
        txt.isEditable = false
        return txt
    }()
    
    private let textField:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Roll Number"
        txt.textColor = .red
        txt.backgroundColor = .gray
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 26)
        txt.borderStyle = .roundedRect
        return txt
    }()
    
    private let lable:UILabel = {
       let lbl = UILabel()
        lbl.text = "Enter DOB"
        return lbl
    }()
    
    private let datePicker:UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -1,to: Date())
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        return datePicker
    }()
    
    private let pgLable:UILabel = {
        let lbl = UILabel()
        lbl.text = "Are you above 18?"
        lbl.textColor = .blue
        return lbl
    }()
    
    private let switch1:UISwitch = {
       let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.tintColor = .red
        switchControl.onTintColor = .green
        return switchControl
    }()
    
    private let segLable:UILabel = {
        let lbl = UILabel()
        lbl.text = "Division"
        lbl.textColor = .blue
        return lbl
    }()
    
    private let segmentControl:UISegmentedControl = {
        let sg = UISegmentedControl()
        sg.insertSegment(withTitle: "A", at: 0, animated: true)
        sg.insertSegment(withTitle: "B", at: 1, animated: true)
        sg.backgroundColor = .yellow
        sg.tintColor = .green
        return sg
    }()
    
    private let buttonControl:UIButton = {
       let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        btn.tintColor = .green
        btn.layer.cornerRadius = 15
        btn.backgroundColor = .red
        return btn
    }()
    
    private let pageControl:UIPageControl = {
       let pg = UIPageControl()
        pg.currentPageIndicatorTintColor = .white
        pg.backgroundColor = .red
        pg.numberOfPages = 2
        pg.currentPage = 0
        return pg
    }()
    
    @objc func nextPage(){
        print("Button Clicked")
        
        let vc = Part2()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UI Elements Examples"
        self.view.backgroundColor = .brown
        view.addSubview(textview)
        view.addSubview(textField)
        view.addSubview(lable)
        view.addSubview(datePicker)
        view.addSubview(buttonControl)
        view.addSubview(pgLable)
        view.addSubview(switch1)
        view.addSubview(segLable)
        view.addSubview(segmentControl)
        view.addSubview(pageControl)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //textview.frame = CGRect(x:20,y:50,width: view.width-40,height: 40)
        textField.frame = CGRect(x:10,y:70, width: view.width-20,height: 40)
        lable.frame = CGRect(x:20,y:textField.bottom+20,width: view.width-40,height: 20)
        datePicker.frame = CGRect(x:20,y:lable.bottom+10,width: view.width-40,height: 60)
        pgLable.frame = CGRect(x:20, y:datePicker.bottom+20,width: view.width-40, height: 40)
        switch1.frame = CGRect(x:280,y:datePicker.bottom+20, width: view.width-40,height: 90)
        segLable.frame = CGRect(x:20,y:switch1.bottom+22,width: view.width-40,height: 40)
        segmentControl.frame = CGRect(x:20,y:segLable.bottom+20,width: view.width-40,height: 40)
        buttonControl.frame = CGRect(x:20,y:segmentControl.bottom+20,width: view.width-40,height: 50)
        pageControl.frame = CGRect(x:20,y:buttonControl.bottom+120,width: view.width-40,height: 20)
    }

}

