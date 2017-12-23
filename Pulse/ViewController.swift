//
//  ViewController.swift
//  Pulse
//
//  Created by Jan Senderek on 12/20/17.
//  Copyright © 2017 Jan Senderek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button: PulseButton = {
        let button = PulseButton()
        button.backgroundColor = .clear
        let img = UIImage(named: "icon_check")
        button.setImage(img, for: .normal)
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    let iconImageView: UIImageView = {
        let img = UIImage(named: "icon_check")
        let imageView = UIImageView(image: img)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(iconImageView)
        iconImageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
 
    }
    

    
    
    
    @objc func didPressButton() {
        print("Pressed button")
        button.animateCircle()
    }
    

    
    
    
    
    



}

