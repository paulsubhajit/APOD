//
//  ImageViewExtension.swift
//  APODApplication
//
//  Created by BKS-GGS on 17/01/22.
//  Copyright © 2022 Subhajit Paul. All rights reserved.
//

import UIKit
extension UIImageView {
    private static var cache = NSCache<NSString, UIImage>()
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        if let image = UIImageView.cache.object(forKey: link as NSString) {
            DispatchQueue.main.async {
                self.image = image
            }
        }else{
            URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                    self.contentMode =  contentMode
                    if let data = data, let image = UIImage(data: data){
                        UIImageView.cache.setObject(image, forKey: link as NSString)
                    }
                    if let data = data { self.image = UIImage(data: data) }
                }
            }).resume()
        }
    }
}
