//
//  BaseViewController.swift
//  TestDemo
//
//  Created by xinguang hu on 2019/10/21.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var interactivePopTransition: UIPercentDrivenInteractiveTransition!

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.delegate = self
        if navigationController != nil && self != navigationController?.viewControllers.first {
            let popGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePopGesture))
            popGesture.edges = .left
            popGesture.delegate = self
            view.addGestureRecognizer(popGesture)
        }
    }
    
    @objc
    func handlePopGesture(recognizer: UIPanGestureRecognizer) {
        var progress = recognizer.translation(in: view).x/view.frame.width
        progress = min(1.0, max(0.0, progress))
        
        switch recognizer.state {
        case .began:
            interactivePopTransition = UIPercentDrivenInteractiveTransition()
            navigationController?.popViewController(animated: true)
        case .changed:
            interactivePopTransition.update(progress)
        case .ended,.cancelled:
            if progress > 0.25 {
                interactivePopTransition.finish()
            }else{
                interactivePopTransition.cancel()
            }
            interactivePopTransition = nil
        default:
            break
        }
        
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

extension BaseViewController: UIGestureRecognizerDelegate{
    
    private func gestureRecognizerShouldBegin(_ gestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return gestureRecognizer.velocity(in: view).x > 0
    }
    
}


//extension BaseViewController: UINavigationControllerDelegate{
//
//    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        let vc = animationController as? CustomNavigationTransition
//        return vc?.interactivePopTransition
//    }
//
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        let vc = fromVC as! BaseViewController
//        if vc.interactivePopTransition != nil {
//            let transitioning = CustomNavigationTransition(operation: operation)
//            transitioning.interactivePopTransition = vc.interactivePopTransition
//            return transitioning
//        }else{
//            let transitioning = CustomNavigationTransition(operation: operation)
//            return transitioning
//        }
//
//    }
//
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        print("willShow")
//    }
//
//
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        print("didShow")
//        if viewController.isKind(of: SignInVC.self) {
//            navigationController.setNavigationBarHidden(true, animated: false)
//        }
//
//    }
//
//
//
//}
