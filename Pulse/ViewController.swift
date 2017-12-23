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
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(iconImageView)
        iconImageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
    }
    

    
    
    
    @objc func didPressButton() {
        print("Pressed button")
        button.isUserInteractionEnabled = false
        
        button.animateCircle()

        UIView.animate(withDuration: 0.1, animations: {
            self.button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.iconImageView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (true) in
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3.0, options: .allowUserInteraction, animations: {
                [weak self] in self?.button.transform = .identity; self?.iconImageView.transform = .identity}, completion: nil)
            self.button.isUserInteractionEnabled = true
        }
    }
    

    
    
    
    
    



}

