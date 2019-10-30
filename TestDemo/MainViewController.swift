//
//  MainViewController.swift
//  TestDemo
//
//  Created by xinguang hu on 2019/10/21.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func test(_ sender: Any) {
        let vc = SignInVC()
        vc.navigationBarHiddenInVC = true
        let nav = BaseNavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
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
