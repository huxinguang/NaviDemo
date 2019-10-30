//
//  UIViewController.swift
//  TestDemo
//
//  Created by xinguang hu on 2019/10/21.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    private struct AssociatedKeys {
        static var snapshotKey = "SnapshotKey"
        static var navigaitionBarHiddenKey = "NavigaitionBarHiddenKey"
    }
    
    var snapshot: UIView? {
        get{
            var snapshotView = objc_getAssociatedObject(self, &AssociatedKeys.snapshotKey) as? UIView
            if snapshotView == nil{
                snapshotView = navigationController?.view.snapshotView(afterScreenUpdates: false)
                snapshotView?.layer.shadowColor = UIColor.black.cgColor
                snapshotView?.layer.shadowOpacity = 0.2
                objc_setAssociatedObject(self, &AssociatedKeys.snapshotKey, snapshotView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return snapshotView
        }
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.snapshotKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var navigationBarHiddenInVC: Bool!{
        get{
            var value = objc_getAssociatedObject(self, &AssociatedKeys.navigaitionBarHiddenKey) as? Bool
            if value == nil {
                value = false
                objc_setAssociatedObject(self, &AssociatedKeys.navigaitionBarHiddenKey, value, .OBJC_ASSOCIATION_ASSIGN)
            }
            return value
        }
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.navigaitionBarHiddenKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    
    
}
