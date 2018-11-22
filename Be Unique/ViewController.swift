//
//  ViewController.swift
//  Be Unique
//
//  Created by ParveshKhan on 23/07/1940 Saka.
//  Copyright © 1940 ParveshKhan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController,UIWebViewDelegate  {

  
    @IBOutlet weak var webview:	UIWebView!
    @IBOutlet weak var imgCenter: UIImageView!
    
    @IBOutlet weak var vMiddle: UIView!
    


    
    public  var strUrl :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jeremyGif = UIImage.gifImageWithName("glowLoader")
        imgCenter.image = jeremyGif
        
        
//        imageView.frame = self.imgCenter.frame
//        self.view.addSubview(imageView)
     
        
        webview.alpha = 0.2
        
        if(strUrl.isEmpty)
        {
            let urlString = "https://www.beunique.com.sa/ar/"
            let request = URLRequest(url: URL(string: urlString)!)
            
            
            webview.loadRequest(request)
        }
        else
        {
            let urlString = strUrl
            let request = URLRequest(url: URL(string: urlString)!)
            webview.loadRequest(request)
        }
        
 }
    func webViewDidFinishLoad(_ webView: UIWebView) {
       imgCenter.isHidden = true
         webview.alpha = 1.0
        vMiddle.isHidden = true
    }
    
    
  
}

extension UIImageView {
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

    


