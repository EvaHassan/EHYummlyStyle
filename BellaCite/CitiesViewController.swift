//
//  YumlyViewController.swift
//  MyDailyPractice
//
//  Created by Hiba Hassan on 1/28/16.
//  Copyright © 2016 Hiba Hassan. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dimmingView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var topMaskView: UIView!
    @IBOutlet weak var bottomMaskView: UIView!
    
    var imageView : UIImageView?
    var originalCenters :[CGFloat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMenuButton()
        setupNotesButton()
        setupSearchButton()
        setupSearchBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        setupCollection()
    }
    
    //MARK: Initializations
    private func setupSearchBar() {
        searchBar.setImage(UIImage(), forSearchBarIcon: UISearchBarIcon.Search, state: .Normal)
        // TODO change font/fint size/ text color
    }
    
    private func setupCollection() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        var size = layout.itemSize
        size.width = view.bounds.width
        layout.itemSize = size
        collectionView.collectionViewLayout = layout
    }
    
    private func setupNotesButton() {
        let aView = UIView(frame: notesButton.bounds)
        aView.backgroundColor = UIColor.clearColor()
        aView.fillViewWithNotesIcon()
        let mask  = aView.circleShapeLayer(notesButton.bounds)
        
        // get bitmap for the drawing
        UIGraphicsBeginImageContextWithOptions(notesButton.bounds.size, true, 0.0);
        aView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // set Button's image
        notesButton.setImage(image, forState: .Normal)
        notesButton.imageView?.layer.mask = mask
    }
    
    
    
    private func setupMenuButton() {
        let aView = UIView(frame: notesButton.bounds)
        aView.backgroundColor = UIColor.clearColor()
        aView.fillViewWithMenuIcon()
        let mask  = aView.circleShapeLayer(notesButton.bounds)
        
        // get bitmap for the drawing
        UIGraphicsBeginImageContextWithOptions(notesButton.bounds.size, true, 0.0);
        aView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // set Button's image
        menuButton.setImage(image, forState: .Normal)
        menuButton.imageView?.layer.mask = mask
    }
    
    private func setupSearchButton() {
        searchButton.fillViewWithSearchIcon()
    }
    
    //MARK: - IBActions
    
    @IBOutlet weak var searchBarContainer_trailingMargin: NSLayoutConstraint!
    @IBOutlet weak var searchBarContainer: UIView!
    @IBOutlet weak var buttonsContainer_topMargin: NSLayoutConstraint!
    @IBOutlet weak var buttonsContainerView: UIView!
    @IBOutlet weak var bellaCiteTrailing_Margin: NSLayoutConstraint!
    @IBOutlet weak var explorationView: UIView!
    //
    @IBAction func searchButtonPressed(sender: UIButton) {
        if buttonsContainer_topMargin.constant == 5 {
            animateButtonsDownAndShowSearchBar()
        } else {
            animateButtonsUpAndHideSearchBar()
        }
    }
    
    func enableSearchBarAsFirstResponder() {
        searchBar.becomeFirstResponder()
    }
    func resignSearchBarAsFirstResponder() {
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
    
    @IBOutlet weak var justForYouButton: UIButton!
    @IBAction func justForYouPressed(sender: AnyObject) {
        justForYouButton.selected = true
        exploreButton.selected = false
    }
 
    @IBOutlet weak var exploreButton: UIButton!
    @IBAction func explorePressed(sender: AnyObject) {
        justForYouButton.selected = false
        exploreButton.selected = true
    }
    
    @IBAction func handleTap(sender: AnyObject) {
        animateButtonsUpAndHideSearchBar()
    }
    
    @IBAction func hideMaskViews(sender: AnyObject) {
        //initiate a slider close action in the cell. To determine which cell is currently being edited, do the following:
        let point = CGPointMake(collectionView.bounds.width/2, collectionView.contentOffset.y)
        if let indexPath = collectionView.indexPathForItemAtPoint(point){
            let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionCell
            cell.cityView.closeSlider()
        }
        
    }
    
  /*  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }*/
    

}

extension CitiesViewController : UISearchBarDelegate {
    //MARK SearchBar Delegate
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
    }
    
}

extension CitiesViewController {
    //MARK:  Animations
    func animateButtonsDownAndShowSearchBar() {
        let searchBarContainer_newTrailingMargin = searchBarContainer_trailingMargin.constant - searchBar.bounds.width - 20
        let buttonContainer_newTopMargin = searchBar.bounds.height
        let transform = CGAffineTransformMakeScale(1.16, 1.16)
        let dimmingColor = UIColor(white: 0.0, alpha: 0.55)
        dimmingView.hidden = false
        //
        view.layoutIfNeeded()
        UIView.animateKeyframesWithDuration(0.25, delay: 0, options: UIViewKeyframeAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            self.enableSearchBarAsFirstResponder()
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: { () -> Void in
                self.enableSearchBarAsFirstResponder()
                self.searchBarContainer_trailingMargin.constant = searchBarContainer_newTrailingMargin
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.3, animations: { () -> Void in
                self.buttonsContainer_topMargin.constant = buttonContainer_newTopMargin
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.8, relativeDuration: 0.2, animations: { () -> Void in
                self.searchButton.transform = transform
                self.dimmingView.backgroundColor = dimmingColor
                self.view.layoutIfNeeded()
            })
            }, completion: nil)
    }
    
    func animateButtonsUpAndHideSearchBar() {
        let searchBarContainer_newTrailingMargin = searchBarContainer_trailingMargin.constant + searchBar.bounds.width + 20
        let buttonContainer_newTopMargin = (searchBar.bounds.height - buttonsContainerView.bounds.height)/2.0
        let scaleTransform = CGAffineTransformIdentity
        let clearColor = UIColor.clearColor()
        //
        view.layoutIfNeeded()
        
        UIView.animateWithDuration(0.15, delay: 0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            self.resignSearchBarAsFirstResponder()
            self.searchBarContainer_trailingMargin.constant = searchBarContainer_newTrailingMargin
            self.buttonsContainer_topMargin.constant = buttonContainer_newTopMargin
            self.searchButton.transform = scaleTransform
            self.view.layoutIfNeeded()
            }) { (finished) -> Void in
                if finished {
                    self.dimmingView.backgroundColor = clearColor
                    self.dimmingView.hidden = true
                }
        }
    }
    
    func dimmViewAndScaleButtonUp() {
        dimmingView.hidden = false
        self.searchButton.transform = CGAffineTransformIdentity
        let transform = CGAffineTransformMakeScale(1.16, 1.16)
        let dimmingColor = UIColor(white: 0.0, alpha: 0.55)
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.1, delay: 0.3, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.searchButton.transform = transform
            self.dimmingView.backgroundColor = dimmingColor
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }

}

extension CitiesViewController: UICollectionViewDataSource {
    //MARK: CollectionView Data Source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Cities.sharedInstance.cities.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionCell
        let city = Cities.sharedInstance.cities[indexPath.row]
    
        cell.cityView.city = city
        cell.cityView.listener = self
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath)
        return view
    }
    
}

extension CitiesViewController: UICollectionViewDelegate {
    //MARK: CollectionView Delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let city = Cities.sharedInstance.cities[indexPath.row]
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("cityvc") as? CityViewController {
            vc.city = city
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension CitiesViewController: UIScrollViewDelegate {
    //MARK: ScrollView Delagate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if  let visibleCells = collectionView.visibleCells() as? [CollectionCell] {
            for cell in visibleCells {
                // delta tells me how far the center moved from its origial position; then I take a ratio of that value and move the imageview inside the view (proportionally)
                let delta = (scrollView.contentOffset.y - cell.center.y)/CGFloat(6.0)
                cell.cityView.imageView_centerY.constant = delta
            }
        }
        
    }
}

extension CitiesViewController: DisableCollectionViewScrolling {
    //MARK: CityView Delegate Methods
    func collectionViewScrollingEnabled(scrollEnabled: Bool) {
        collectionView.scrollEnabled = scrollEnabled
    }
    
    func scrollCellToTop(cell: CollectionCell) {
        let indexpath = collectionView.indexPathForCell(cell)
        collectionView.scrollToItemAtIndexPath(indexpath!, atScrollPosition: .Top, animated: true)
        topMaskView.hidden = false
        bottomMaskView.hidden = false
    }
    
    func shouldClearTopAndBottomMaskViews(clear: Bool) {
        topMaskView.hidden = true
        bottomMaskView.hidden = true
    }
}
