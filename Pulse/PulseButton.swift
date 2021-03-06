//
//  StudyButtonView.swift
//  StudyView
//
//  Created by Jan Senderek on 12/18/17.
//  Copyright © 2017 Jan Senderek. All rights reserved.
//

import UIKit

class PulseButton: UIButton {
    
    let buttonFillLayer = CAShapeLayer()
    let pulsatingLayer = CAShapeLayer()
    
    var buttonFillLayerFillColor:   UIColor = .buttonLayerFillColor                                               { didSet { buttonFillLayer.fillColor = buttonFillLayerFillColor.cgColor } }
    var pulsatingLayerFillColor:   UIColor = .pulsatingLayerFillColor                                             { didSet { pulsatingLayer.fillColor = pulsatingLayerFillColor.cgColor } }

    var buttonFillLayerStrokeStart: CGFloat = 0                                                                   { didSet { buttonFillLayer.strokeStart = buttonFillLayerStrokeStart } }
    var pulsatingLayerStrokeStart: CGFloat = 0                                                                    { didSet { pulsatingLayer.strokeStart = pulsatingLayerStrokeStart } }
    
    var buttonFillLayerStrokeEnd:   CGFloat = 1                                                                   { didSet { buttonFillLayer.strokeEnd = buttonFillLayerStrokeEnd } }
    var pulsatingLayerStrokeEnd:   CGFloat = 1                                                                    { didSet { pulsatingLayer.strokeEnd = pulsatingLayerStrokeEnd } }
    

    //INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }


    //REQUIRED INIT
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }


    //LAYOUT SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePaths()
    }


    //DRAW PATHS
    private func setupLayout() {
        pulsatingLayer.strokeColor = UIColor.clear.cgColor
        pulsatingLayer.fillColor = buttonFillLayerFillColor.cgColor
        pulsatingLayer.strokeStart = buttonFillLayerStrokeStart
        pulsatingLayer.strokeEnd  = buttonFillLayerStrokeEnd
        
        buttonFillLayer.strokeColor = UIColor.clear.cgColor
        buttonFillLayer.fillColor = pulsatingLayerFillColor.cgColor
        buttonFillLayer.strokeStart = pulsatingLayerStrokeStart
        buttonFillLayer.strokeEnd  = pulsatingLayerStrokeEnd
        
        layer.addSublayer(pulsatingLayer)
        layer.addSublayer(buttonFillLayer)
    }
    
    
    //UPDATE PATHS
    private func updatePaths()  {
        print("Updating")
        
        //Parameters for layers
        let arcCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height)) / 2
        let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true).cgPath
    
        pulsatingLayer.transform = CATransform3DIdentity
        pulsatingLayer.frame = bounds
        pulsatingLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        buttonFillLayer.transform = CATransform3DIdentity
        buttonFillLayer.frame = bounds
        buttonFillLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        
        pulsatingLayer.path = path
        buttonFillLayer.path = path
    }



    func animateCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
        basicAnimation.fromValue = 1
        basicAnimation.toValue = 1.4
        basicAnimation.duration = 0.8
        basicAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        pulsatingLayer.add(basicAnimation, forKey: "pulsing")

        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.6
        opacityAnimation.toValue = 0
        opacityAnimation.duration = 0.8
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        pulsatingLayer.add(opacityAnimation, forKey: "changing opacity")
    }
    
}







