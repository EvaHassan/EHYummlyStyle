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
    @IBOutlet weak var showTableButton: UIButton!
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    
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
    
    //MARK: Initializations
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
    
    //MARK: IBActions and Gestures
    @IBAction func buttonPressed(sender: AnyObject) {
        updateCity()
        animateLikeButtonChanges()
        
    }
    
    var previousPoint = CGPointZero
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(dimmingView)
        switch(sender.state) {
        case .Began:
            showTableButton.enabled = false
            previousPoint = translation
            break
        case .Changed:
            updateSlider(translation)
            previousPoint = translation
            break
        case .Ended, .Failed, .Cancelled:
            if imageContainer_trailingMargin.constant > bounds.width/4  &&
                imageContainer_trailingMargin.constant <= bounds.width/2 {
                openSlider()
            } else  {
                closeSlider()
            }
            break
        default:
            break
        }
    }
    
    
    func updateCity() {
        guard let city = city else {
            return
        }
        city.ratingCount = city.isLiked ? city.ratingCount - 1 : city.ratingCount+1
        city.isLiked = !city.isLiked
    }
    
    
    //MARK: Animations and Effects
    func updateSlider(change: CGPoint) {
        if change.x <= 0 {
            imageContainer_trailingMargin.constant =  min(bounds.width/2, imageContainer_trailingMargin.constant - (change.x - previousPoint.x))
        } else if change.x > 0  && imageContainer_trailingMargin.constant > 0 {
            imageContainer_trailingMargin.constant = max(0, imageContainer_trailingMargin.constant - (change.x - previousPoint.x))
        }
    }
    
    func closeSlider() {
        self.layoutIfNeeded()
        UIView.animateWithDuration(0.3) { () -> Void in
            self.imageContainer_trailingMargin.constant = 0
            self.gradient?.removeFromSuperlayer()
            self.dimmingView.backgroundColor = UIColor.clearColor()
            self.layoutIfNeeded()
        }
    }
    func openSlider() {
        self.layoutIfNeeded()
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.imageContainer_trailingMargin.constant = self.bounds.width/2
            self.dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
            self.layoutIfNeeded()
            }) { (finished) -> Void in
                if finished {
                    self.applyGradientToView(self.dimmingView)
                }
        }
    }
    
    func animateLikeButtonChanges() {
        guard let city = city else {
            return
        }
        likeButton.count = city.ratingCount
        city.isLiked ? likeButton.performSelector("colorWhite") : likeButton.performSelector("colorRed")
    }
    
    func showHideTableView() {
        var newConstant: CGFloat = 0
        if self.imageContainer_trailingMargin.constant == 0 {
            openSlider()
            newConstant = bounds.width/2
        } else {
            closeSlider()
        }
        animateFontSizeChange(newConstant != 0)
    }
    
    
    //TODO: clean it and add more color and locations to aide in the animation with the pan gesture
    func applyGradientToView(aView: UIView) {
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
    }
    
    func animateFontSizeChange(small: Bool) {
        UIView.beginAnimations(nil, context: nil)
        nameLabel.transform = small ? CGAffineTransformMakeScale(0.7,0.7) : CGAffineTransformIdentity
        UIView.commitAnimations()
    }

}

extension CityView: UIGestureRecognizerDelegate {
    //MARK: Gesture Recognizer Delegate
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
}


extension CityView: UITableViewDataSource {
  //MARK: TabelView Data Source
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
    //MARK: TabelView Delegate
}

