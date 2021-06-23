//
//  Part 2.swift
//  UIElements
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part2: UIViewController {
    
    private let hourLabel:UILabel = {
       let lbl = UILabel()
        lbl.text = "How many hours you can provide?"
        lbl.textAlignment = .center
        lbl.textColor = .black
        return lbl
    }()
    
    private let step:UIStepper = {
       let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 5
        stepper.addTarget(self, action: #selector(stepperHandle), for: .valueChanged)
        return stepper
    }()
    
    @objc func stepperHandle(){
        let val = step.value
        stepperText.text = String(val)
    }
    
    private let stepperText : UITextView = {
        let txt = UITextView()
        txt.isEditable = false
        txt.font = UIFont.systemFont(ofSize: 18.0)
        txt.textColor = .black
        txt.textAlignment = .center
        txt.backgroundColor = .gray
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    private let progressBar : UIProgressView = {
        let pBar = UIProgressView()
        pBar.setProgress(0.0, animated: true)
        pBar.trackTintColor = .red
        pBar.progressTintColor = .black
        return pBar
    }()
    
    private let rateLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Rate Us!"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .black
        return lbl
    }()
    
    public let mySlider:UISlider = {
       let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderVal), for: .valueChanged)
        return slider
    }()
    
    @objc func sliderVal(){
        let res = Int(mySlider.value)
        rateUsText.text = String(res)
    }
    
    private let rateUsText : UITextView = {
        let txt = UITextView()
        txt.isEditable = false
        txt.font = UIFont.systemFont(ofSize: 18.0)
        txt.textColor = .black
        txt.textAlignment = .center
        txt.backgroundColor = .gray
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    private let tabBar:UITabBar = {
       let tabBar = UITabBar()
        let upload = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        tabBar.items = [upload]
        return tabBar
    }()
    
    private let activity:UIActivityIndicatorView = {
        let ac = UIActivityIndicatorView()
//        ac.style = .big
        ac.color = .blue
        ac.startAnimating()
        ac.isHidden = false
        return ac
    }()
    
    private let buttonControl:UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
//        btn.tintColor = .green
        btn.backgroundColor = .blue
        return btn
    }()
    
    private let pageControl:UIPageControl = {
        let pg = UIPageControl()
        pg.currentPageIndicatorTintColor = .white
        pg.backgroundColor = .red
        pg.numberOfPages = 2
        pg.currentPage = 1
        return pg
    }()
    
    @objc func nextPage()
    {
        let vc = Part3()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Part 2"
        view.backgroundColor = .white
        view.addSubview(progressBar)
        view.addSubview(buttonControl)
        view.addSubview(step)
        view.addSubview(mySlider)
        view.addSubview(activity)
        view.addSubview(tabBar)
        view.addSubview(pageControl)
        view.addSubview(hourLabel)
        view.addSubview(stepperText)
        view.addSubview(rateUsText)
        view.addSubview(rateLabel)
    }
    
    override func viewDidLayoutSubviews() {
//        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 05
//        toolBar.frame = CGRect(x:0, y:70, width: view.width, height: toolBarHeight)
        progressBar.frame = CGRect(x:20,y:120, width: view.width-40,height: 50)
        hourLabel.frame = CGRect(x:20, y:progressBar.bottom+10, width: view.width-40, height: 40)
        step.frame = CGRect(x:20,y:hourLabel.bottom+20, width: view.width-40,height: 50)
        stepperText.frame = CGRect(x:250, y:hourLabel.bottom+15, width: 60, height: 40)
        rateLabel.frame = CGRect(x:20, y:stepperText.bottom+20, width: view.width-40,height: 40)
        mySlider.frame = CGRect(x:20,y:rateLabel.bottom+15,width: view.width-40,height: 10)
        rateUsText.frame = CGRect(x:20, y:mySlider.bottom+20, width: view.width - 40, height: 40)
        tabBar.frame = CGRect(x:0, y:view.height-40, width: view.width,height: 38)
        activity.frame = CGRect(x:20, y:rateUsText.bottom+20,width: view.width-40,height: 20)
        buttonControl.frame = CGRect(x:20,y:activity.bottom+20,width: view.width-40, height: 50)
        pageControl.frame = CGRect(x:20,y:buttonControl.bottom+120,width: view.width-40,height: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0){
            self.progressBar.setProgress(1.0, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
