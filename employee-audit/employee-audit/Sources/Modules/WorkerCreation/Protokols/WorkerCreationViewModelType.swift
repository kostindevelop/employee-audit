//
//  WorkerCreationViewModelType.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 12.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

enum TypeController {
    case create, update
}

enum TypeWorker {
    case managment, employee, accountant
}

protocol WorkerCreationViewModelType {
    var worker: BaseModel? { get set }
    var typeController: TypeController { get set }
    var typeWorker: TypeWorker { get set }
    func saveNewWorker(name: String, salary: Int)
}
