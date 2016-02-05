//
//  CityView.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 2/3/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import UIKit

class CityView: UIView {
    let BACKGROUNDGRAY = UIColor(red: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0)
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageContainer_trailingMargin: NSLayoutConstraint!
    @IBOutlet weak var imageView_centerY: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var dimmingView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var likeButton: CustomLikeButton!
    
    @IBOutlet var view: UIView!
    
    var gradient: CAGradientLayer?
    
    var city: City?  {
        didSet {
            if let city = city {
                nameLabel.text = city.name
                likeButton.count = city.ratingCount
                likeButton.isLikedConfig = city.isLiked
                if let image = UIImage(named: city.imageName) {
                    imageView.image = image
                }
                tableView.reloadData()
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        
    }
    
    func loadViewFromNib() {
        let subviewsArray = NSBundle.mainBundle().loadNibNamed("CityView", owner: self, options: nil)
        let newView = subviewsArray[0] as! UIView
        newView.frame = self.bounds
        view = newView
        self.addSubview(newView)
        likeButton.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        configureTableView()
    }
    
    func configureTableView() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "landmark")
        tableView.rowHeight = 40.0
        //
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        updateCity()
        animateLikeButtonChanges()
        
    }
    
    func updateCity() {
        guard let city = city else {
            return
        }
        city.ratingCount = city.isLiked ? city.ratingCount - 1 : city.ratingCount+1
        city.isLiked = !city.isLiked
    }
    
    func animateLikeButtonChanges() {
        guard let city = city else {
            return
        }
        likeButton.count = city.ratingCount
        city.isLiked ? likeButton.performSelector("colorWhite") : likeButton.performSelector("colorRed")
    }
    
    func showHideTableView() {
        var newConstant: CGFloat = bounds.width/2
        if imageContainer_trailingMargin.constant > 0 {
            newConstant = 0
            self.gradient?.removeFromSuperlayer()
            self.dimmingView.backgroundColor = UIColor.clearColor()
        }
        layoutIfNeeded()
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.imageContainer_trailingMargin.constant = newConstant
            self.likeButton.alpha = (newConstant == 0) ? 1.0 : 0.0
            self.layoutIfNeeded()
            }, completion: { (finished) in
                if newConstant != 0 {
                   self.applyGradientAndDimmingToView(self.dimmingView)
                }
        })
        animateFontSizeChange(newConstant != 0)
    }
    
    
    func applyGradientAndDimmingToView(aView: UIView) {
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds//aView.bounds
        gradient.colors = [ UIColor(white: 0.0, alpha: 0.0).CGColor, UIColor(white: 0.0, alpha: 0.7).CGColor]
        gradient.startPoint = CGPointMake(0.25, 1.0)
        gradient.endPoint = CGPointMake(0.5, 1.0)
        aView.layer.addSublayer(gradient)
        self.gradient = gradient
        
        // dimm
        aView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
    }
    
    func animateFontSizeChange(small: Bool) {
        UIView.beginAnimations(nil, context: nil)
        nameLabel.transform = small ? CGAffineTransformMakeScale(0.7,0.7) : CGAffineTransformIdentity
        UIView.commitAnimations()
    }


}




extension CityView: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (city?.landmarks.count ?? 0) > 0 ? 1 : 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city?.landmarks.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("landmark", forIndexPath: indexPath)
        
        cell.textLabel?.text = city!.landmarks[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 11.0)
        cell.textLabel?.textColor = UIColor.lightGrayColor()
        cell.textLabel?.backgroundColor = indexPath.row % 2 == 0 ? UIColor.whiteColor() : BACKGROUNDGRAY
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.whiteColor() : BACKGROUNDGRAY
        cell.selectionStyle = .None
        return cell
    }
    
 /*   func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var rect = tableView.bounds
        rect.size.height = 40.0
        let header = UIView(frame: rect)
        header.backgroundColor = UIColor.redColor()
        return header
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var rect = tableView.bounds
        rect.size.height = 46.0
        let header = UIView(frame: rect)
        header.backgroundColor = UIColor.yellowColor()
        return header
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    } */

    
}

extension CityView: UITableViewDelegate {
    
}

