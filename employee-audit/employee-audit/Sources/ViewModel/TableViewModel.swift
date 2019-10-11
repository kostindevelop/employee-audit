//
//  TableViewModel.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class TableViewModel: TableViewModelType {
    
    var employees = [
    Employee(name: "Lena", index: ""),
    Employee(name: "Jony", index: ""),
    Employee(name: "Konstantin", index: "")]
    
    var numberOfRows: Int {
        return employees.count
    }
    
    func employeeRemove(at indexPath: IndexPath) {
        employees.remove(at: indexPath.row)
    }
    
    func employeeInsert(_ employe: Employee, to: IndexPath) {
        employees.insert(employe, at: to.row)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let employee = employees[indexPath.row]
        return TableViewCellViewModel(employee: employee)
    }
    
}
