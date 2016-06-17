//
//  MoviesViewController.swift
//  flix
//
//  Created by Angela Chen on 6/15/16.
//  Copyright © 2016 Angela Chen. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD


class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var switchButton: UIBarButtonItem!
    
    var movies: [NSDictionary]?
    var isCell = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Error message
        errorView.hidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadDataFromNetwork()
        
        // Initialize a UIRefreshControl
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadDataFromNetwork(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
    }
    
    func loadDataFromNetwork(refreshControl: UIRefreshControl? = nil) {
        self.errorView.hidden = true
        
        // Display HUD right before the request is made & make a network request
        if refreshControl == nil {
            MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        }
        
        let apiKey = "a8b0132bbb48b3a30cb7757d88fea788"
        let url = NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = NSURLRequest(
            URL: url!,
            cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: nil,
            delegateQueue: NSOperationQueue.mainQueue()
        )
        
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(data, options:[]) as? NSDictionary {
                    self.movies = responseDictionary["results"] as? [NSDictionary]
                    self.tableView.reloadData()
                }
            } else {
                // Network error
                self.errorView.hidden = false
            }
            
            if let refreshControl = refreshControl {
                // Tell the refreshControl to stop spinning
                refreshControl.endRefreshing()
            } else {
                // Ends loading state
                MBProgressHUD.hideHUDForView(self.view, animated: true)
            }
        })
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        }
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        
        let movie = movies![indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String

        let baseURL = "http://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as? String
        let imageRequest = NSURLRequest(URL:NSURL(string: baseURL + posterPath!)!)
        
        cell.posterView.setImageWithURLRequest(
            imageRequest,
            placeholderImage: nil,
            success: { (imageRequest, imageResponse, image) -> Void in
                
                // imageResponse will be nil if the image is cached
                if imageResponse != nil {
                    cell.posterView.alpha = 0.0
                    cell.posterView.image = image
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        cell.posterView.alpha = 1.0
                    })
                } else {
                    cell.posterView.image = image
                }
            },
            failure: { (imageRequest, imageResponse, error) -> Void in
                // do something for the failure condition
                let filmImageURL = "film.jpeg"
                let filmImage = UIImage(named: filmImageURL)
                cell.posterView.image = filmImage
        })
        
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        return cell
        
    }
    
     // MARK: - Navigation
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailSegue" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let movie = movies![indexPath!.row]
            
            cell.selectionStyle = .None
        
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.movie = movie
        } else {
            let detailViewController = segue.destinationViewController as! GridMoviesViewController
            detailViewController.movies = movies
            
        }
        
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    
    
}
