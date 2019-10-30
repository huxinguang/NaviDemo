//
//  TestViewController.swift
//  PlayerDemo
//
//  Created by xinguang hu on 2019/10/11.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "测试"

        
    }

    @IBAction func test(_ sender: Any) {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
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
