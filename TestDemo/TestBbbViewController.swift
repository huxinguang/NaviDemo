//
//  TestBbbViewController.swift
//  TestDemo
//
//  Created by xinguang hu on 2019/10/30.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

class TestBbbViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func test(_ sender: Any) {
        let vc = navigationController?.children[0]
        navigationController?.setNavigationBarHidden(vc!.navigationBarHiddenInVC, animated: false)
        navigationController?.popToViewController(vc!, animated: true)
//        navigationController?.popToRootViewController(animated: true)
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
