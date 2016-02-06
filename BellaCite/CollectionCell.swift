//
//  CollectionCell.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 1/28/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var cityView: CityView!
    @IBOutlet weak var imageView_center: NSLayoutConstraint!
    @IBOutlet weak var labelContainer: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var gradient: CAGradientLayer?
    
    override func awakeFromNib() {
    }
    
    func applyGradientToView(aView: UIView) {
        if let gradient = self.gradient where gradient.frame.width == self.bounds.width {
            return
        }
        
        if let gradient = self.gradient {
            
            gradient.removeFromSuperlayer()
        }
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds//aView.bounds
            gradient.colors = [ UIColor(white: 0.0, alpha: 0.0).CGColor, UIColor(white: 0.0, alpha: 1.0).CGColor]
            gradient.startPoint = CGPointMake(0.5, 0.7)
            gradient.endPoint = CGPointMake(0.5, 1.0)
            aView.layer.addSublayer(gradient)
            self.gradient = gradient
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradientToView(cityView.bottomGradientDimmingView)
       
        
    } 
    
}
