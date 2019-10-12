//
//  AddEmployeeViewController.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {

    var workerCreationViewModel: WorkerCreationViewModelType?
    
    var typeController: TypeController = .create {
        didSet {
            workerCreationViewModel?.typeController = typeController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workerCreationViewModel = WorkerCreationViewModel()
        self.navigationItem.title = "Add employee"
    }
    
    @IBAction func didTabSaveBurButtonItem(_ sender: UIBarButtonItem) {
        print("employee saved")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTabCancelBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
