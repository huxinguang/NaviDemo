//
//  CustomNavigationTransition.swift
//  TestDemo
//
//  Created by xinguang hu on 2019/10/21.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

class CustomNavigationTransition: NSObject {
    var interactivePopTransition: UIPercentDrivenInteractiveTransition?
    var operation: UINavigationController.Operation!
    var duration: TimeInterval!
    
    init(operation: UINavigationController.Operation,duration: TimeInterval = 0.6) {
        super.init()
        self.operation = operation
        self.duration = duration
    }
    
    func push(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        fromVC?.view.isHidden = true
        transitionContext.containerView.addSubview(toVC!.view)
        toVC?.navigationController?.view.superview?.insertSubview(fromVC!.snapshot!, belowSubview: (toVC?.navigationController!.view)!)
        toVC?.navigationController?.view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveLinear, animations: {
            fromVC?.snapshot!.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            toVC?.navigationController?.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (finished) in
            fromVC?.view.isHidden = false
            fromVC?.snapshot!.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }

    func pop(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from) as! BaseViewController
        let toVC = transitionContext.viewController(forKey: .to) as! BaseViewController
        print("fromVC = " + "\(fromVC.self)")
        print("toVC = " + "\(toVC.self)")
        let maskView = UIView(frame: CGRect(x: -UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        maskView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        transitionContext.containerView.addSubview(maskView)
        maskView.transform = .identity
        
        transitionContext.containerView.addSubview(toVC.view)
        transitionContext.containerView.addSubview(toVC.snapshot!)
        if fromVC.snapshot != nil {
            transitionContext.containerView.addSubview(fromVC.snapshot!)
        }
    
        transitionContext.containerView.sendSubviewToBack(toVC.snapshot!)
        if fromVC.snapshot != nil {
            transitionContext.containerView.bringSubviewToFront(fromVC.snapshot!)
        }
        
        fromVC.view.isHidden = true
        fromVC.navigationController?.navigationBar.isHidden = true
        toVC.view.isHidden = true
        toVC.snapshot!.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        // 手势pop时为线性动画，点击按钮pop时为弹簧效果
        if fromVC.interactivePopTransition != nil {
            UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
                fromVC.snapshot?.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                maskView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                toVC.snapshot!.transform = .identity
                maskView.alpha = 0
            }) { (_) in
                toVC.navigationController?.navigationBar.isHidden = false
                fromVC.navigationController?.navigationBar.isHidden = false
                toVC.view.isHidden = false
                fromVC.view.isHidden = false
                fromVC.snapshot?.removeFromSuperview()
                toVC.snapshot!.removeFromSuperview()
                maskView.removeFromSuperview()
                fromVC.snapshot = nil
                
                let cancelled = transitionContext.transitionWasCancelled
                if !cancelled{
                    toVC.snapshot = nil
                }
                transitionContext.completeTransition(!cancelled)
            }
        }else{
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveLinear, animations: {
                fromVC.snapshot?.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                maskView.alpha = 0
                toVC.snapshot?.transform = .identity

            }) { (_) in
                fromVC.navigationController?.navigationBar.isHidden = false
                toVC.navigationController?.navigationBar.isHidden = false
                toVC.view.isHidden = false
                fromVC.view.isHidden = false
                fromVC.snapshot?.removeFromSuperview()
                toVC.snapshot?.removeFromSuperview()
                maskView.removeFromSuperview()
                fromVC.snapshot = nil

                let cancelled = transitionContext.transitionWasCancelled
                if !cancelled{
                    toVC.snapshot = nil
                }
                transitionContext.completeTransition(!cancelled)
            }
        }
        
    }
    
    func pushDidEnded(){
        
    }
    
    func popDidEnded(){
        
    }

}

extension CustomNavigationTransition: UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if operation == .push {
            push(using: transitionContext)
        }else{
            pop(using: transitionContext)
        }
    }
    
    func animationEnded(_ transitionCompleted: Bool) {
        if operation == .push {
            pushDidEnded()
        }else if operation == .pop{
            popDidEnded()
        }
    }
    
}
