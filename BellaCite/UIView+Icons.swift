//
//  UIView+Icons.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 2/4/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    func fillViewWithSearchIcon() {
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        circleLayer.fillColor = UIColor(red: 220.0/255, green: 215/255, blue: 215/255, alpha: 1.0).CGColor
        let backgroundPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2.0)
        circleLayer.path = backgroundPath.CGPath
        layer.addSublayer(circleLayer)
        // icon in 1/3 view size
        var rect = CGRectZero
        rect.size.width = self.bounds.size.width/3
        rect.size.height = bounds.size.height/3
        rect.origin.x = bounds.size.width/3
        rect.origin.y = bounds.size.height/3
        let iconShape = CAShapeLayer()
        iconShape.frame = bounds
        iconShape.fillColor = UIColor.clearColor().CGColor
        iconShape.strokeColor = UIColor.grayColor().CGColor
        iconShape.lineWidth = 1.5
        // magnifying glass
        var glassRect = rect
        glassRect.size.width = rect.size.width * 0.7
        glassRect.size.height = rect.size.height * 0.7
        glassRect.origin.x = bounds.width/2 - glassRect.size.width/2 - 1.0
        glassRect.origin.y = bounds.height/2 - glassRect.size.height/2 - 1.0
        let glassBezier = UIBezierPath(roundedRect: glassRect, cornerRadius: glassRect.width/2)
        glassBezier.moveToPoint(CGPointMake(glassRect.origin.x + glassRect.width * 0.8, glassRect.origin.y + glassRect.height*0.8))
        glassBezier.addLineToPoint(CGPointMake(bounds.width * 0.66, bounds.height * 0.66))
        iconShape.path = glassBezier.CGPath
        layer.addSublayer(iconShape)
    }
    
    
    func fillViewWithMenuIcon() {
        // icon background
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        circleLayer.fillColor = UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0).CGColor
        let backgroundPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2.0)
        circleLayer.path = backgroundPath.CGPath
        layer.addSublayer(circleLayer)
        // icon in 1/3 view size
        var rect = CGRectZero
        rect.size.width = self.bounds.size.width/3
        rect.size.height = bounds.size.height/3
        rect.origin.x = bounds.size.width/3
        rect.origin.y = bounds.size.height/3
        let iconShape = CAShapeLayer()
        iconShape.frame = bounds
        iconShape.fillColor = UIColor.clearColor().CGColor
        iconShape.strokeColor = UIColor.whiteColor().CGColor
        let lineWidth: CGFloat = 1.5
        let space: CGFloat = 2.125 * lineWidth
        iconShape.lineWidth = lineWidth
        // bezier
        let menuBezier = UIBezierPath()
        // center line
        menuBezier.moveToPoint(CGPointMake(rect.origin.x, rect.origin.y + rect.height/2 - iconShape.lineWidth/2))
        menuBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width,  rect.origin.y + rect.height/2 - iconShape.lineWidth/2))
        // line above center
        menuBezier.moveToPoint(CGPointMake(rect.origin.x,  rect.origin.y + rect.height/2 - iconShape.lineWidth/2 - space ))
        menuBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width,  rect.origin.y + rect.height/2 - iconShape.lineWidth/2 - space))
        
        menuBezier.moveToPoint(CGPointMake(rect.origin.x, rect.origin.y + rect.height/2 - iconShape.lineWidth/2 + space))
        menuBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width, rect.origin.y + rect.height/2 - iconShape.lineWidth/2 + space))
        iconShape.path = menuBezier.CGPath
        layer.addSublayer(iconShape)
    }
    
    func fillViewWithListIcon(){
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        let fillColor = UIColor(red: 85.0/255, green: 85/255, blue: 85/255, alpha: 1.0)
        circleLayer.fillColor = fillColor.CGColor
        let backgroundPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2.0)
        circleLayer.path = backgroundPath.CGPath
        layer.addSublayer(circleLayer)
        var rect = CGRectZero
        rect.size.width = self.bounds.size.width/3
        rect.size.height = bounds.size.height/3
        rect.origin.x = bounds.size.width/3
        rect.origin.y = bounds.size.height/3
        let rectShape = CAShapeLayer()
        rectShape.frame = bounds
        rectShape.fillColor = UIColor.whiteColor().CGColor
        let bezier = UIBezierPath()
        bezier.moveToPoint(CGPointMake(rect.origin.x + rect.width * 0.7, rect.origin.y))
        bezier.addLineToPoint(rect.origin)
        bezier.addLineToPoint(CGPointMake(rect.origin.x, rect.origin.y + rect.height))
        bezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width, rect.origin.y + rect.height))
        bezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width, rect.origin.y + rect.height * 0.3))
        bezier.closePath()
        rectShape.path = bezier.CGPath
        layer.addSublayer(rectShape)
        //
        let iconShape = CAShapeLayer()
        iconShape.frame = bounds
        iconShape.fillColor = UIColor.clearColor().CGColor
        iconShape.strokeColor = fillColor.CGColor
        let lineWidth: CGFloat = 1.0
        let space: CGFloat = 2.0 * lineWidth
        iconShape.lineWidth = lineWidth
        let listBezier = UIBezierPath()
        listBezier.moveToPoint(CGPointMake(rect.origin.x + rect.width * 0.7, rect.origin.y))
        listBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width * 0.7, rect.origin.y + rect.height * 0.3))
        listBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width, rect.origin.y + rect.height * 0.3))
        listBezier.moveToPoint(CGPointMake(rect.origin.x + rect.width * 0.1, rect.origin.y + rect.height * 0.3))
        listBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width * 0.5, rect.origin.y + rect.height * 0.3))
        for i in 1...3 {
            listBezier.moveToPoint(CGPointMake(rect.origin.x + rect.width * 0.1, rect.origin.y + rect.height * 0.3 + CGFloat(i)*space))
            listBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width * 0.9, rect.origin.y + rect.height * 0.3 + CGFloat(i)*space))
        }
        iconShape.path = listBezier.CGPath
        layer.addSublayer(iconShape)
        
    }
    
    
    func fillViewWithBackIcon() {
        if !self.isKindOfClass(UIButton.self) {
            return
        }
        
        // since we need the button to highlight when pressed, we need to add an image to button Imageview
        // instead of just adding CAShapeLayers as above
        // Mask to be added to button imageView,layer.Mask
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        circleLayer.fillRule = kCAFillRuleEvenOdd;
        let backgroundPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2.0)
        circleLayer.path = backgroundPath.CGPath
        
        //
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 2.0)
        let context = UIGraphicsGetCurrentContext()
        //
        var rect = CGRectZero
        rect.size.width = self.bounds.size.width/3
        rect.size.height = bounds.size.height/3
        rect.origin.x = bounds.size.width/3
        rect.origin.y = bounds.size.height/3
        CGContextSetStrokeColorWithColor(context, UIColor.grayColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, bounds)
        //
        let backBezier = UIBezierPath()
        backBezier.moveToPoint(CGPointMake(bounds.width/2 - 2.5 , bounds.height/2))
        backBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width - 2.5, rect.origin.y ))
        backBezier.moveToPoint(CGPointMake(bounds.width/2 - 2.5, bounds.height/2))
        backBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width - 2.5, rect.origin.y + rect.height))
        backBezier.lineWidth = 1.5
        backBezier.stroke()
        CGContextAddPath(context, backBezier.CGPath)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // set image in imageview
        self.imageView?.layer.mask = circleLayer
        self.setImage(image, forState: .Normal)
        
    }
    
    func fillViewWithLandmarksIcon() {
        if !self.isKindOfClass(UIButton.self) {
            return
        }
        
        // since we need the button to highlight when pressed, we need to add an image to button Imageview
        // instead of just adding CAShapeLayers as above
        // Mask to be added to button imageView,layer.Mask
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        circleLayer.fillRule = kCAFillRuleEvenOdd;
        let backgroundPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.size.width/2.0)
        circleLayer.path = backgroundPath.CGPath
        
        //
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 2.0)
        let context = UIGraphicsGetCurrentContext()
        //
        var rect = CGRectZero
        rect.size.width = self.bounds.size.width/3
        rect.size.height = bounds.size.height/3
        rect.origin.x = bounds.size.width/2.6
        rect.origin.y = bounds.size.height/2.6
        let fillColor = UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0)
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextSetFillColorWithColor(context, fillColor.CGColor)
        CGContextFillRect(context, bounds)
        //
        let lineWidth: CGFloat = 1.0
        let space: CGFloat = 2.35 * lineWidth
        let landmarkBezier = UIBezierPath()
        landmarkBezier.moveToPoint(CGPointMake(rect.origin.x , rect.origin.y))
        landmarkBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width * 0.35, rect.origin.y ))
        landmarkBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width * 0.35, rect.origin.y + rect.height * 0.5 ))
        landmarkBezier.addLineToPoint(CGPointMake(rect.origin.x , rect.origin.y + rect.height * 0.5 ))
        landmarkBezier.closePath()
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        landmarkBezier.fill()
        CGContextAddPath(context, landmarkBezier.CGPath)
        for i in 1...2 {
            landmarkBezier.moveToPoint(CGPointMake(rect.origin.x + CGFloat(i) * space - 1 , rect.origin.y + rect.height * 0.5 + CGFloat(i) * space ))
            landmarkBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width * 0.35 + CGFloat(i) * space, rect.origin.y + rect.height * 0.5 + CGFloat(i) * space ))
            landmarkBezier.addLineToPoint(CGPointMake(rect.origin.x + rect.width * 0.35 + CGFloat(i) * space , rect.origin.y + CGFloat(i) * space ))
            landmarkBezier.stroke()
        }
        CGContextAddPath(context, landmarkBezier.CGPath)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // set image in imageview
        self.imageView?.layer.mask = circleLayer
        self.setImage(image, forState: .Normal)
        
    }

    
    
    
}

