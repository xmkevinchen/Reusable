//
//  NibLoadable.swift
//  CKMessagesKit
//
//  Created by Kevin Chen on 8/31/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {
    
    static var nib: UINib { get }
    
}

public extension NibLoadable {
    
    static var nib: UINib {
        #if swift(>=3.0)
            return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
        #else
            return UINib(nibName: String(self), bundle: NSBundle(forClass: self))
        #endif
    }
}

public extension NibLoadable where Self: UIView {
    
    static func viewFromNib() -> Self {
        #if swift(>=3.0)
            
            guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
            }
            
        #else
            guard let view = nib.instantiateWithOwner(nil, options: nil).first as? Self else {
                fatalError("The nib \(nib) expected its root view to be of type \(self)")
            }
            
        #endif
        
        return view
    }
    
}
