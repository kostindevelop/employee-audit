//
//  AddEmployeeViewController.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Add employee"
    }
    
    @IBAction func didTabSaveBurButtonItem(_ sender: UIBarButtonItem) {
        print("employee saved")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTabCancelBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
