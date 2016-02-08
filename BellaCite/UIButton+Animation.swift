//
//  UIButton+Animation.swift
//  BellaCite
//
//  Created by Hiba Hassan on 2/7/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import Foundation
import UIKit

class ListButton: UIButton {

    let layersInfoGreen: [[String: AnyObject]]
                       = [["fillColor"  : UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0),
                           "strokeColor": UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0)],
                            ["fillColor": UIColor.whiteColor(),
                           "strokeColor": UIColor.whiteColor()],
                            ["fillColor": UIColor.clearColor(),
                           "strokeColor": UIColor.whiteColor()]]
    
    let layersInfoGray : [[String: AnyObject]]
                     =  [["fillColor"  : UIColor(red: 220.0/255, green: 215/255, blue: 215/255, alpha: 1.0),
                          "strokeColor": UIColor(red: 220.0/255, green: 215/255, blue: 215/255, alpha: 1.0)],
                           ["fillColor": UIColor.blackColor(),
                          "strokeColor": UIColor.blackColor()],
                           ["fillColor": UIColor.clearColor(),
                          "strokeColor": UIColor.blackColor()]]
    
    
    
    override func configureGray() {
        if let shapeLayers = layer.sublayers as? [CAShapeLayer] {
            shapeLayers[0].fillColor = (layersInfoGray[0]["fillColor"] as! UIColor).CGColor // Gray
            shapeLayers[0].strokeColor = (layersInfoGray[0]["strokeColor"] as! UIColor).CGColor // Gray
            shapeLayers[1].fillColor = (layersInfoGray[1]["fillColor"] as! UIColor).CGColor
            shapeLayers[1].strokeColor = (layersInfoGray[1]["strokeColor"] as! UIColor).CGColor
            shapeLayers[2].fillColor = (layersInfoGray[2]["fillColor"] as! UIColor).CGColor
            shapeLayers[2].strokeColor = (layersInfoGray[2]["strokeColor"] as! UIColor).CGColor
            //
            shapeLayers[0].transform = CATransform3DMakeScale(1.0, 1.0, 0.0)
        }
    }
    override func configureGreen() {
        if let shapeLayers = layer.sublayers as? [CAShapeLayer] {
            shapeLayers[0].fillColor   = (layersInfoGreen[0]["fillColor"] as! UIColor).CGColor // Gray
            shapeLayers[0].strokeColor = (layersInfoGreen[0]["strokeColor"] as! UIColor).CGColor // Gray
            shapeLayers[1].fillColor   = (layersInfoGreen[1]["fillColor"] as! UIColor).CGColor
            shapeLayers[1].strokeColor = (layersInfoGreen[1]["strokeColor"] as! UIColor).CGColor
            shapeLayers[2].fillColor   = (layersInfoGreen[2]["fillColor"] as! UIColor).CGColor
            shapeLayers[2].strokeColor = (layersInfoGreen[2]["strokeColor"] as! UIColor).CGColor
            //
            shapeLayers[0].transform = CATransform3DMakeScale(0.8, 0.8, 0.0)
        }
    }
    
    func animateDown() {
        animateDown(layersInfoGray, to: layersInfoGreen)
    }
    func animateUP() {
        animateUP(layersInfoGreen, to: layersInfoGray)
    }
    
}

class NotesButton: UIButton {
    let layersInfoGreen: [[String: AnyObject]]
                        = [["fillColor"  : UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0),
                            "strokeColor": UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0)],
                            ["fillColor" : UIColor.whiteColor(),
                            "strokeColor": UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0)],
                            ["fillColor" : UIColor.clearColor(),
                            "strokeColor": UIColor(red: 0.0/255, green: 139/255, blue: 132/255, alpha: 1.0)]]
    
    let layersInfoGray : [[String: AnyObject]]
                        =  [["fillColor"  : UIColor(red: 220.0/255, green: 215/255, blue: 215/255, alpha: 1.0),
                            "strokeColor" : UIColor(red: 220.0/255, green: 215/255, blue: 215/255, alpha: 1.0)],
                            ["fillColor"  : UIColor.blackColor(),
                            "strokeColor" : UIColor.blackColor()],
                            ["fillColor"  : UIColor.clearColor(),
                            "strokeColor" : UIColor(red: 220.0/255, green: 215/255, blue: 215/255, alpha: 1.0)]]
    
    override func configureGray() {
        if let shapeLayers = layer.sublayers as? [CAShapeLayer]{
            shapeLayers[0].fillColor   = (layersInfoGray[0]["fillColor"] as! UIColor).CGColor // Gray
            shapeLayers[0].strokeColor = (layersInfoGray[0]["strokeColor"] as! UIColor).CGColor // Gray
            shapeLayers[1].fillColor   = (layersInfoGray[1]["fillColor"] as! UIColor).CGColor
            shapeLayers[1].strokeColor = (layersInfoGray[1]["strokeColor"] as! UIColor).CGColor
            shapeLayers[2].fillColor   = (layersInfoGray[2]["fillColor"] as! UIColor).CGColor
            shapeLayers[2].strokeColor = (layersInfoGray[2]["strokeColor"] as! UIColor).CGColor
            //
            shapeLayers[0].transform = CATransform3DMakeScale(1.0, 1.0, 0.0)
            
        }
    }
    override func configureGreen() {
        if let shapeLayers = layer.sublayers as? [CAShapeLayer] {
            shapeLayers[0].fillColor   = (layersInfoGreen[0]["fillColor"] as! UIColor).CGColor // Gray
            shapeLayers[0].strokeColor = (layersInfoGreen[0]["strokeColor"] as! UIColor).CGColor // Gray
            shapeLayers[1].fillColor   = (layersInfoGreen[1]["fillColor"] as! UIColor).CGColor
            shapeLayers[1].strokeColor = (layersInfoGreen[1]["strokeColor"] as! UIColor).CGColor
            shapeLayers[2].fillColor   = (layersInfoGreen[2]["fillColor"] as! UIColor).CGColor
            shapeLayers[2].strokeColor = (layersInfoGreen[2]["strokeColor"] as! UIColor).CGColor
            shapeLayers[0].transform = CATransform3DMakeScale(0.8, 0.8, 0.0)
            
        }
    }
    
    func animateDown() {
        animateDown(layersInfoGray, to: layersInfoGreen)
    }
    func animateUP() {
        animateUP(layersInfoGreen, to: layersInfoGray)
    }

}

extension UIButton {
    func configureInitialState() {
        if selected {
            configureGray()
        } else {
            configureGreen()
        }
    
    }
    
    func configureGreen() { }
    
    func configureGray() { }

    func animateDown(from: [[String: AnyObject]], to: [[String:AnyObject]]) {
        if let shapeLayers = layer.sublayers as? [CAShapeLayer] {
            for shapeLayer in shapeLayers {
                if let index = shapeLayers.indexOf(shapeLayer){
                    let scaleDown = setScaleAnimation(shapeLayer)
                    setScaleDownValues(scaleDown, layerInfo: createDictionary(from, to: to, layerIndex: index))
                    shapeLayer.addAnimation(scaleDown, forKey: "scale")
                    
                }
            }
        }
    }
    
    func animateUP(from: [[String: AnyObject]], to: [[String:AnyObject]]) {
        if let shapeLayers = layer.sublayers as? [CAShapeLayer] {
            for shapeLayer in shapeLayers {
                if let index = shapeLayers.indexOf(shapeLayer){
                    let scaleUP = setScaleAnimation(shapeLayer)
                    setScaleUPValues(scaleUP, layerInfo: createDictionary(from, to: to, layerIndex: index))
                    shapeLayer.addAnimation(scaleUP, forKey: "scale")
                    
                }
            }
        }
    }
    
    private func createDictionary(from: [[String: AnyObject]], to: [[String:AnyObject]],layerIndex: Int) -> [String: AnyObject] {
        let from = from[layerIndex]
        let to   = to[layerIndex]
        let scale = layerIndex == 0 ? true : false
        return ["from" : from, "to": to, "scale": scale]
    }
    
    private func setScaleDownValues(group: CAAnimationGroup, layerInfo: [String : AnyObject]) {
        if let scale = layerInfo["scale"] as? Bool where scale {
            (group.animations![0] as! CABasicAnimation).fromValue = NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0.0))
            (group.animations![0] as! CABasicAnimation).toValue   = NSValue(CATransform3D: CATransform3DMakeScale(0.8, 0.8, 0.0))
        }
        
        (group.animations![1] as! CABasicAnimation).fromValue = ((layerInfo["from"] as! [String: AnyObject])["fillColor"] as! UIColor).CGColor
        (group.animations![1] as! CABasicAnimation).toValue = ((layerInfo["to"] as! [String: AnyObject])["fillColor"] as! UIColor).CGColor
        (group.animations![2] as! CABasicAnimation).fromValue = ((layerInfo["from"] as! [String: AnyObject])["strokeColor"] as! UIColor).CGColor
        (group.animations![2] as! CABasicAnimation).toValue = ((layerInfo["to"] as! [String: AnyObject])["strokeColor"] as! UIColor).CGColor
        
    }
    
    private func setScaleUPValues(group: CAAnimationGroup, layerInfo: [String : AnyObject]) {
        if let scale = layerInfo["scale"] as? Bool where scale {
            (group.animations![0] as! CABasicAnimation).fromValue = NSValue(CATransform3D: CATransform3DMakeScale(0.8, 0.8, 0.0))
            (group.animations![0] as! CABasicAnimation).toValue   = NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0.0))
        }
        
        (group.animations![1] as! CABasicAnimation).fromValue = ((layerInfo["from"] as! [String: AnyObject])["fillColor"] as! UIColor).CGColor
        (group.animations![1] as! CABasicAnimation).toValue = ((layerInfo["to"] as! [String: AnyObject])["fillColor"] as! UIColor).CGColor
        (group.animations![2] as! CABasicAnimation).fromValue = ((layerInfo["from"] as! [String: AnyObject])["strokeColor"] as! UIColor).CGColor
        (group.animations![2] as! CABasicAnimation).toValue = ((layerInfo["to"] as! [String: AnyObject])["strokeColor"] as! UIColor).CGColor
        
    }
    
    private func setScaleAnimation(shapeLayer: CAShapeLayer) -> CAAnimationGroup {
        let scale = CABasicAnimation(keyPath: "transform.scale")
        let fill = CABasicAnimation(keyPath: "fillColor")
        let stroke = CABasicAnimation(keyPath: "strokeColor")
        //
        let group = CAAnimationGroup()
        group.duration = Double(0.6)
        group.fillMode = kCAFillModeForwards
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        group.removedOnCompletion = false
        group.repeatCount = 0
        group.animations = [scale, fill, stroke]
        return group
    }
    
    func showBloatAnimation() {
        let scaleUpDown = CABasicAnimation(keyPath: "transform.scale")
        scaleUpDown.duration = Double(0.15)
        scaleUpDown.removedOnCompletion = true
        scaleUpDown.repeatCount = 2
        scaleUpDown.autoreverses = true
        scaleUpDown.toValue = NSValue(CATransform3D: CATransform3DMakeScale(0.925, 0.925, 0.0))
        scaleUpDown.fromValue   = NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0.0))
        layer.addAnimation(scaleUpDown, forKey: "scaleUpDown")
    }
}