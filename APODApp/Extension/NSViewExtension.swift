//
//  NSViewExtension.swift
//  APODApplication
//

import UIKit
public extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
