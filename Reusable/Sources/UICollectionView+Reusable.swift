//
//  UICollectionView+Reusable.swift
//  CKMessagesKit
//
//  Created by Kevin Chen on 8/31/16.
//  Copyright © 2016 Kevin Chen. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    #if swift(>=3.0)
    final func register<T: UICollectionViewCell>(for type: T.Type) where T: NibReusable {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    final func register<T: UICollectionViewCell>(for type: T.Type) where T: Reusable {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueReusable<T: UICollectionViewCell>(at indexPath: IndexPath, for type: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else  {
            fatalError(
                "Failed to dequeue a cell with identifier \(type.reuseIdentifier) matching type \(type.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        
        return cell
    }
    
    final func register<T: UICollectionReusableView>(forSupplementaryView ofKind : String, for type: T.Type = T.self) where T: NibReusable {
        register(T.nib, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    final func register<T: UICollectionReusableView>(forSupplementaryView ofKind : String, for type: T.Type = T.self)
        where T: Reusable {
        register(T.self, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueReusable<T: UICollectionReusableView>(forSupplementaryView ofKind: String, at indexPath: IndexPath, for type: T.Type = T.self) -> T where T: Reusable {
        guard let view = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a supplementary view with identifier \(type.reuseIdentifier) matching type \(type.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the supplementary view beforehand"
            )
        }
        
        return view
    }
    
    #else
    
    final func register<T: UICollectionViewCell where T: NibReusable>(for type: T.Type) {
        registerNib(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    final func register<T: UICollectionViewCell where T: Reusable>(for type: T.Type) {
        registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueReusable<T: UICollectionViewCell where T: Reusable>(at indexPath: NSIndexPath, for type: T.Type = T.self) -> T {
        
        guard let cell = dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(type.reuseIdentifier) matching type \(type.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        
        return cell
    }
    
    final func register<T: UICollectionReusableView where T: NibReusable>(forSupplementaryView ofKind : String, for type: T.Type = T.self)  {
        registerNib(T.nib, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    final func register<T: UICollectionReusableView where T: Reusable>(forSupplementaryView ofKind : String, for type: T.Type = T.self) {
        registerClass(T.self, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueReusable<T: UICollectionReusableView where T: Reusable>(forSupplementaryView ofKind: String, at indexPath: NSIndexPath, for type: T.Type = T.self) -> T  {
        
        guard let view = dequeueReusableSupplementaryViewOfKind(ofKind, withReuseIdentifier: T.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a supplementary view with identifier \(type.reuseIdentifier) matching type \(type.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the supplementary view beforehand"
            )
        }
        
        return view
    }

    
    
    
    #endif
    
}

