//
//  CustomLikeButton.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 2/3/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import UIKit

protocol ButtonPressedListener {
    func likeButtonPressed()
}

class CustomLikeButton: UIButton {
    let DURATION: Double = 0.25
    let MyREDCOLOR = UIColor(red: 225.0/255.0, green: 93.0/255.0, blue: 45.0/255.0, alpha: 1.0)
    
    var largeShapeLayer : CAShapeLayer?
    var smallShapeLayer : CAShapeLayer?
    
    var largeTextLayer : CATextLayer?
    var smallTextLayer : CATextLayer?
    
    var largeColorAnimation: CABasicAnimation?
    var smallColorAnimation: CABasicAnimation?
    
    var largeRotationAnimation : CABasicAnimation?
    var smallRotationAnimation : CABasicAnimation?
    var addRating = false
    
        
        
    var isLikedConfig : Bool? {
        didSet {
            performSelector("setLikedConfig")
        }
    }
    var count = 0 {
        didSet {
            if let smallTextLayer = smallTextLayer {
                smallTextLayer.string = count.format() //  countString
            }
        }
    }
    
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.clearColor()
        drawLargeCircle()
        drawSmallCircle()
        //
        setupLargeText()
        setupSmallText()
        //
        largeColorAnimationSetup()
        smallColorAnimationSetup()
        //
        setupLargeRotationAnimation()
        setupSmallRotationAnimation()
    }
    
    func drawLargeCircle() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        let rect = CGRectMake(0, 0, self.frame.width * 3/4, self.frame.height * 3/4)
        let bezier = UIBezierPath(roundedRect: rect, cornerRadius: rect.height/2)//UIBezierPath(ovalInRect: shapeLayerView.bounds)
        shapeLayer.fillColor = MyREDCOLOR.CGColor
        shapeLayer.path = bezier.CGPath
        self.largeShapeLayer = shapeLayer
        self.layer.addSublayer(shapeLayer)
    }
    
    func drawSmallCircle() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        let rect = CGRectMake(self.frame.width/2, self.frame.height/2, self.frame.width/2, self.frame.height/2)
        let bezier = UIBezierPath(roundedRect: rect, cornerRadius: rect.height/2)//UIBezierPath(ovalInRect: shapeLayerView.bounds)
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        shapeLayer.path = bezier.CGPath
        self.smallShapeLayer = shapeLayer
        self.layer.addSublayer(shapeLayer)
    }
    
    
    func setupLargeRotationAnimation () {
        let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        rotationAnimation.duration = DURATION
        rotationAnimation.autoreverses = false
        rotationAnimation.repeatCount = 0
        rotationAnimation.removedOnCompletion = false
        rotationAnimation.fillMode = kCAFillModeForwards
        self.largeRotationAnimation = rotationAnimation
    }
    
    func setupSmallRotationAnimation () {
        let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        rotationAnimation.duration = DURATION
        rotationAnimation.autoreverses = false
        rotationAnimation.repeatCount = 0
        rotationAnimation.removedOnCompletion = false
        rotationAnimation.fillMode = kCAFillModeForwards
        self.smallRotationAnimation = rotationAnimation
    }
    
    func rotateText(angle: Float, rotationAnimation: CABasicAnimation) {
        rotationAnimation.fromValue = NSNumber(float: 0)
        rotationAnimation.toValue =  NSNumber(float: angle)
    }
    
    
    func largeColorAnimationSetup() {
        let colorAnimation = CABasicAnimation.init(keyPath: "fillColor")
        colorAnimation.duration = DURATION
        colorAnimation.autoreverses = false
        colorAnimation.repeatCount = 0
        colorAnimation.removedOnCompletion = false
        colorAnimation.fillMode = kCAFillModeForwards
        self.largeColorAnimation = colorAnimation
        toRedColor(colorAnimation)
    }
    
    func smallColorAnimationSetup() {
        let colorAnimation = CABasicAnimation.init(keyPath: "fillColor")
        colorAnimation.duration = DURATION
        colorAnimation.autoreverses = false
        colorAnimation.repeatCount = 0
        colorAnimation.removedOnCompletion = false
        colorAnimation.fillMode = kCAFillModeForwards
        self.smallColorAnimation = colorAnimation
        toWhiteColor(colorAnimation)
    }
    
    func toWhiteColor(colorAnimation: CABasicAnimation) {
        colorAnimation.fromValue = MyREDCOLOR.CGColor
        colorAnimation.toValue = UIColor.whiteColor().CGColor
    }
    func toRedColor(colorAnimation: CABasicAnimation) {
        colorAnimation.fromValue = UIColor.whiteColor().CGColor
        colorAnimation.toValue = MyREDCOLOR.CGColor
    }
    
    
    func setupLargeText() {
        let textLayer  = CATextLayer()
        let rect = CGRectMake(0, 0, self.frame.width * 3/4, self.frame.height * 3/4)
        textLayer.string = "Bella"
        textLayer.alignmentMode = kCAAlignmentCenter
        //textLayer.font = UIFont(name: "Zapfino", size: 1)
        //textLayer.font = UIFont(name: "Snell Roundhand-Bold", size: 1)
        textLayer.font = UIFont(name: "SnellRoundhand-bold", size: 1)
        textLayer.fontSize = 13.0
        textLayer.foregroundColor = UIColor.whiteColor().CGColor
        //textLayer.frame =  CGRectMake(0, shapeLayerView.frame.height/2 - textLayer.fontSize/2, shapeLayerView.bounds.width, 50) //shapeLayerView.bounds
        textLayer.frame =  CGRectMake(0, rect.height/4, rect.width, rect.height/2)
        self.largeTextLayer = textLayer
        self.layer.addSublayer(textLayer)
    }
    
    func setupSmallText() {
        let textLayer  = CATextLayer()
        let rect = CGRectMake(self.frame.width/2, self.frame.height/2, self.frame.width/2, self.frame.height/2)
        
        textLayer.alignmentMode = kCAAlignmentCenter
        //textLayer.font = UIFont(name: "Snell Roundhand", size: 10)
        textLayer.font = UIFont(name: "helvetica", size: 17)
        textLayer.fontSize = 9.0
        textLayer.foregroundColor = MyREDCOLOR.CGColor
        //textLayer.frame =  CGRectMake(0, shapeLayerView.frame.height/2 - textLayer.fontSize/2, shapeLayerView.bounds.width, 50) //shapeLayerView.bounds
        textLayer.frame =  CGRectMake(rect.origin.x, self.frame.height * 3/4 - textLayer.fontSize/2 , rect.width, rect.height/2) //shapeLayerView.bounds
        
        self.smallTextLayer = textLayer
        self.layer.addSublayer(textLayer)
    }
    
    
    func setLikedConfig() {
        guard let isLikedConfig = isLikedConfig else {
            return
        }
        largeShapeLayer?.removeAllAnimations()
        smallShapeLayer?.removeAllAnimations()
        if isLikedConfig {
            largeShapeLayer?.fillColor = UIColor.whiteColor().CGColor
            smallShapeLayer?.fillColor = MyREDCOLOR.CGColor
            largeTextLayer?.foregroundColor = MyREDCOLOR.CGColor
            smallTextLayer?.foregroundColor = UIColor.whiteColor().CGColor
        } else {
            largeShapeLayer?.fillColor = MyREDCOLOR.CGColor
            smallShapeLayer?.fillColor = UIColor.whiteColor().CGColor
            largeTextLayer?.foregroundColor = UIColor.whiteColor().CGColor
            smallTextLayer?.foregroundColor = MyREDCOLOR.CGColor
        }
    }
    
    
    func colorWhite() {
        toWhiteColor(largeColorAnimation!)
        toRedColor(smallColorAnimation!)
        rotateText(Float(2 * M_PI), rotationAnimation: largeRotationAnimation!)
        rotateText(Float(-2 * M_PI), rotationAnimation: smallRotationAnimation!)
        smallTextLayer!.string = "\(count.format())"
        self.largeShapeLayer!.addAnimation(self.largeColorAnimation!, forKey: "fillColor")
        self.smallShapeLayer!.addAnimation(self.smallColorAnimation!, forKey: "fillColor")
        self.largeTextLayer!.addAnimation(self.largeRotationAnimation!, forKey: "transform.rotation")
        self.smallTextLayer!.addAnimation(self.smallRotationAnimation!, forKey: "transform.rotation")
        
        textTransactionAnimation(MyREDCOLOR, smallColor: UIColor.whiteColor())
    }
    
    func colorRed() {
        toRedColor(largeColorAnimation!)
        toWhiteColor(smallColorAnimation!)
        rotateText(Float(-2 * M_PI), rotationAnimation: largeRotationAnimation!)
        rotateText(Float(2 * M_PI), rotationAnimation: smallRotationAnimation!)
        smallTextLayer!.string = "\(count.format())"
        
        self.largeShapeLayer!.addAnimation(self.largeColorAnimation!, forKey: "fillColor")
        self.smallShapeLayer!.addAnimation(self.smallColorAnimation!, forKey: "fillColor")
        self.largeTextLayer!.addAnimation(self.largeRotationAnimation!, forKey: "transform.rotation")
        self.smallTextLayer!.addAnimation(self.smallRotationAnimation!, forKey: "transform.rotation")
        textTransactionAnimation(UIColor.whiteColor(), smallColor: MyREDCOLOR)
        
    }
    
    func textTransactionAnimation(largeColor: UIColor, smallColor: UIColor) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(DURATION)
        CATransaction.setDisableActions(true)
        largeTextLayer?.foregroundColor = largeColor.CGColor
        smallTextLayer?.foregroundColor = smallColor.CGColor
        CATransaction.commit()
    }


    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
