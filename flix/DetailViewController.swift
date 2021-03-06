//
//  DetailViewController.swift
//  flix
//
//  Created by Angela Chen on 6/16/16.
//  Copyright © 2016 Angela Chen. All rights reserved.
//

import UIKit
import HCSStarRatingView

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var starRating: HCSStarRatingView!
    @IBOutlet weak var NumReviewLabel: UILabel!
    @IBOutlet weak var showtimeButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    
    @IBOutlet weak var ticketButton: UIButton!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientView: CAGradientLayer = CAGradientLayer()
        gradientView.frame = overlayView.bounds
        gradientView.colors = [UIColor.clearColor().CGColor, UIColor.blackColor().CGColor]
        gradientView.locations = [0.0, 0.5]
        overlayView.layer.mask = gradientView
        
        let title = movie["title"] as? String
        titleLabel.text = title
        self.navigationItem.title = title
        
        let overview = movie["overview"] as? String
        overviewTextView.text = overview
        
        let stars = (movie["vote_average"] as? CGFloat)!/2
        starRating.value = stars
        
        let votes = movie["vote_count"] as! Int
        NumReviewLabel.text = String("\(votes) votes")
        
        
        let baseURL = "http://image.tmdb.org/t/p/w500"
        
        if let posterPath = movie["poster_path"] as? String {
            let imageURL = NSURL(string: baseURL + posterPath)
            posterImageView.setImageWithURL(imageURL!)
        }
        
        infoButton.layer.borderWidth = 1
        infoButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        showtimeButton.layer.borderWidth = 1
        showtimeButton.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    @IBAction func showtimeAction(sender: AnyObject) {
        let baseURL = "http://www.fandango.com/search?q="
        let filmTitle = movie["title"] as! String
        let combo = String(baseURL + filmTitle)
        let comboURL = combo.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        print(comboURL)
        UIApplication.sharedApplication().openURL(NSURL(string: comboURL)!)
    }

    @IBAction func infoAction(sender: AnyObject) {
        let baseURL = "http://www.imdb.com/find?s=all&q="
        let filmTitle = movie["title"] as! String
        let combo = String(baseURL + filmTitle)
        let comboURL = combo.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        print(comboURL)
        UIApplication.sharedApplication().openURL(NSURL(string: comboURL)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
