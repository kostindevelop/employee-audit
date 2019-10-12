//
//  TableViewModel.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class TableViewModel: TableViewModelType {

    var workers: [BaseModel] = []
    
    var employees = [
    EmployeeModel(name: "Lena", index: ""),
    EmployeeModel(name: "Johni", index: ""),
    EmployeeModel(name: "Konstantin", index: "")]
    
    var numberOfRows: Int {
        return employees.count
    }
    
    func loadData() {
        StorageService.shared.saveWorke(Managment.self)
        workers = StorageService.shared.getAllWorkers()
        print(workers.count)
    }
    
    func employeeRemove(at indexPath: IndexPath) {
        workers.remove(at: indexPath.row)
        let worker = workers[indexPath.row]
        StorageService.shared.delete(object: worker)
    }
    
    func employeeInsert(_ employe: EmployeeModel, to: IndexPath) {
        employees.insert(employe, at: to.row)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let employee = employees[indexPath.row]
        return TableViewCellViewModel(employee: employee)
    }
    
}
