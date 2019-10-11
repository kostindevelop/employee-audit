//
//  TableViewModel.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class TableViewModel: TableViewModelType {
    
    var employee = [
    Employee(name: "Lena", index: ""),
    Employee(name: "Jony", index: ""),
    Employee(name: "Konstantin", index: "")]
    
    var numberOfRows: Int {
        return employee.count
    }
    
    func employeeRemove(at indexPath: IndexPath) {
        employee.remove(at: indexPath.row)
    }
    
    func employeeInsert(_ employe: Employee, to: IndexPath) {
        employee.insert(employe, at: to.row)
    }
    
}
