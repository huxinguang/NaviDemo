//
//  BaseNavigationController.swift
//  TestDemo
//
//  Created by xinguang hu on 2019/10/21.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.isEnabled = false
        delegate = self
        
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()//去掉黑线
        navigationBar.barTintColor = UIColor.purple
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseNavigationController: UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        let vc = animationController as? CustomNavigationTransition
        return vc?.interactivePopTransition
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let vc = fromVC as! BaseViewController
        if vc.interactivePopTransition != nil {
            let transitioning = CustomNavigationTransition(operation: operation)
            transitioning.interactivePopTransition = vc.interactivePopTransition
            return transitioning
        }else{
            let transitioning = CustomNavigationTransition(operation: operation)
            return transitioning
        }
        
    }
    
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print("didShow")
        if viewController.isKind(of: SignInVC.self) || viewController.isKind(of: TestAaaViewController.self){
            navigationController.setNavigationBarHidden(true, animated: false)
        }else{
            navigationController.setNavigationBarHidden(false, animated: false)
        }
        
        
    }
    
    
    
}
