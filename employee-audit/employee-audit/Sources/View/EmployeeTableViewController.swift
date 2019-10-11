//
//  EmployeeTableViewController.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

struct Employee {
    var name: String
    var index: String
}

class EmployeeTableViewController: UITableViewController {
    
    var tableViewModel: TableViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewModel = TableViewModel()
        self.title = "Employees"
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        }
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    @available(iOS 13.0, *)
    @IBAction func didTapAddEmployee(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addEmployeeVC = storyboard.instantiateViewController(identifier: "AddEmployeeScreen")
        present(addEmployeeVC, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel?.numberOfRows ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Employee", for: indexPath) as? EmployeeTableViewCell

        guard let employeeCell = cell else { return UITableViewCell() }
        
        let item = tableViewModel?.employee[indexPath.row]
        
        employeeCell.employeeName.text = "\(item?.name ?? "")"
        employeeCell.employeeIndex.text = "\(indexPath.row)"

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
        guard let rowToMove = tableViewModel?.employee[fromIndexPath.row] else { return }
        tableViewModel?.employeeRemove(at: fromIndexPath)
        tableViewModel?.employeeInsert(rowToMove, to: to)
    }
}
