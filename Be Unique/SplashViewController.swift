//
//  SplashViewController.swift
//  Be Unique
//
//  Created by ParveshKhan on 24/07/1940 Saka.
//  Copyright © 1940 ParveshKhan. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let refreshedToken = InstanceID.instanceID().token() {
            print("InstanceID token: \(refreshedToken)")
          
            let urlString = "http://admin.beunique.com.sa/rest_api/details.php"
            
            Alamofire.request(urlString, method: .post, parameters: ["deviceid": refreshedToken,"type":"i"],encoding: JSONEncoding.default, headers: nil).responseString {
                response in
                switch response.result {
                case .success:
                    print("success")
                    print(response)
                    
                    break
                case .failure(let error):
                    
                    print("errorcall",error)
                }
            }
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
           let vcSecond =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
            
            self.present(vcSecond, animated: true, completion:nil)
        }
        
        
    }

   
    

  

}
