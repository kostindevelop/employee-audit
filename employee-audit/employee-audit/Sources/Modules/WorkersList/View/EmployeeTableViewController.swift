//
//  EmployeeTableViewController.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class EmployeeTableViewController: UITableViewController {
    
    var tableViewModel: TableViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewModel = TableViewModel()
        self.title = "Employees"
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        }
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: Common.NotificationIdentifire.saveNewWorker), object: nil)
        reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func reloadData() {
        tableViewModel?.loadData()
        self.tableView.reloadData()
    }

    @IBAction func didTapAddEmployee(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            guard let addEmployeeScreen = storyboard?.instantiateViewController(
                identifier: Common.ScreenIdentifire.addEmployeeScreen,
                creator: { coder in
                    AddEmployeeViewController(coder: coder)
            }) else {
                fatalError("Unable to create PreviewController")
            }
            present(addEmployeeScreen, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel?.numberOfRows ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Common.CellIdentifire.employCell, for: indexPath) as? EmployeeTableViewCell

        guard let employeeCell = cell else { return UITableViewCell() }
        
        let tableCellViewModel = tableViewModel?.cellViewModel(forIndexPath: indexPath) as? TableViewCellViewModel
        
        employeeCell.viewModel = tableCellViewModel
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableViewModel?.employeeRemove(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }    
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        guard let rowToMove = tableViewModel?.workers[fromIndexPath.row] else { return }
        tableViewModel?.employeeRemove(at: fromIndexPath)
        tableViewModel?.employeeInsert(rowToMove, to: to)
    }
}
