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
        backButton.fillViewWithBackIcon()
        listButton.fillViewWithLandmarksIcon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
