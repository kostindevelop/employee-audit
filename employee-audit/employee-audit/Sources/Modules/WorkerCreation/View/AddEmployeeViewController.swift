//
//  AddEmployeeViewController.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {

    @IBOutlet weak private var labelNameWorker: UITextField!
    @IBOutlet weak private var labelSalaryWorker: UITextField!
    
    var workerCreationViewModel: WorkerCreationViewModelType?
    
    var typeController: TypeController = .create {
        didSet {
            workerCreationViewModel?.typeController = typeController
        }
    }
    
    var typeWorker: TypeWorker = .employee {
        didSet {
            workerCreationViewModel?.typeWorker = typeWorker
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workerCreationViewModel = WorkerCreationViewModel()
        self.navigationItem.title = "Add employee"
    }
    
    @IBAction func didTabSegmentControll(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            typeWorker = .employee
        case 1:
            typeWorker = .managment
        case 2:
            typeWorker = .accountant
        default:
            break
        }
    }
    
    
    @IBAction func didTabSaveBurButtonItem(_ sender: UIBarButtonItem) {
        print("employee saved")
        guard let name = labelNameWorker.text, let salary = labelSalaryWorker.text else {
            return
        }
        workerCreationViewModel?.saveNewWorker(name: name, salary: Int(salary) ?? 0)
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: Common.NotificationIdentifire.saveNewWorker)))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTabCancelBarButtonItem(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
