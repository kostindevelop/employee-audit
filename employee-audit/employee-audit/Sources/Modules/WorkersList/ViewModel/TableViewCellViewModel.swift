//
//  TableViewCellViewModel.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 11.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private let employee: BaseModel
    
    var name: String {
        return employee.name ?? ""
    }
    
    var salary: String {
        return "\(employee.salary)"
    }
    
    
    init(employee: BaseModel) {
        self.employee = employee
    }
    
}
