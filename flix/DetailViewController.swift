//
//  DetailViewController.swift
//  flix
//
//  Created by Angela Chen on 6/16/16.
//  Copyright © 2016 Angela Chen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientView: CAGradientLayer = CAGradientLayer()
        gradientView.frame = overlayView.bounds
        gradientView.colors = [UIColor.clearColor().CGColor, UIColor.whiteColor().CGColor]
        gradientView.locations = [0.0, 0.7]
        overlayView.layer.mask = gradientView
        
        let title = movie["title"] as? String
        titleLabel.text = title
        self.navigationItem.title = title
        
        let overview = movie["overview"] as? String
        overviewLabel.text = overview
        
        let baseURL = "http://image.tmdb.org/t/p/w500"
        
        if let posterPath = movie["poster_path"] as? String {
            let imageURL = NSURL(string: baseURL + posterPath)
            posterImageView.setImageWithURL(imageURL!)
        }
        
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
