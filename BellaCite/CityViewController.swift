//
//  CityViewController.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 2/4/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var cityView: CityView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var listButton: UIButton!

    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityView.city = city
        cityView.imageView.contentMode = .ScaleAspectFill
        cityView.generalDelegate = self
        setupBackButton()
        setupListButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Initializations
    private func setupBackButton() {
        backButton.fillViewWithBackIcon()
    }
    
    private func setupListButton() {
        let aView = UIView(frame: listButton.bounds)
        aView.backgroundColor = UIColor.clearColor()
        aView.fillViewWithListIcon()
        let mask  = aView.circleShapeLayer(listButton.bounds)
        
        // get bitmap for the drawing
        UIGraphicsBeginImageContextWithOptions(listButton.bounds.size, true, 0.0);
        aView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // set Button's image
        listButton.setImage(image, forState: .Normal)
        listButton.imageView?.layer.mask = mask
       
    }
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func landmarksButtonPressed(sender: AnyObject) {
        cityView.performSelector("showHideTableView")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CityViewController: CityViewGeneralDelegate {
    func sliderWillOpen() {
        UIView.animateWithDuration(0.25) { () -> Void in
            self.backButton.alpha = 0.0
            self.listButton.alpha = 0.0
        }
    }
    
    func sliderWillClose() {
        UIView.animateWithDuration(0.25) { () -> Void in
            self.backButton.alpha = 1.0
            self.listButton.alpha = 1.0
        }
    }
    
    func sliderDidSlide(alpha: CGFloat) {
        backButton.alpha = alpha
        listButton.alpha = alpha
    }
}
