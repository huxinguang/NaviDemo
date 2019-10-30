//
//  SignInVC.swift
//  PlayerDemo
//
//  Created by xinguang hu on 2019/10/8.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

class SignInVC: BaseViewController {

    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var agreementBtn: UIButton!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.borderWidth = 0.5
        signUpBtn.layer.borderColor = UIColor(displayP3Red: 11/255, green: 95/255, blue: 255/255, alpha: 1).cgColor
        
    }

    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        let vc = TestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onSignUp(_ sender: Any) {
    }
    
    @IBAction func onAgreement(_ sender: Any) {
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

//extension SignInVC{
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        print("didShow")
//        if viewController.isKind(of: SignInVC.self) {
//            navigationController.setNavigationBarHidden(true, animated: false)
//        }
//        
//    }
//}
