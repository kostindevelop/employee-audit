//
//  StorageService.swift
//  employee-audit
//
//  Created by Konstantin Igorevich on 12.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation
import CoreData

class StorageService {
    
    static let shared = StorageService()
    
    private let persistantContainerName = "employee_audit"
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistantContainerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    private func save() {
        if context.hasChanges {
            do {
                try context.save()
                print("save successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
    func saveNewWorker(with type: TypeWorker, name: String, salary: Int) {
        var newObject = BaseModel()
        switch type {
        case .employee:
            newObject = Employee(context: context)
        case .accountant:
            newObject = Accountant(context: context)
        case .managment:
            newObject = Managment(context: context)
        default:
            break
        }
        newObject.name = name
        newObject.salary = Int64(salary)
        save()
    }
    
    func saveWorke<T>(_ object: T.Type) where T: BaseModel {
        _ = T(context: context)
        save()
    }
    
    func delete(object: NSManagedObject) {
        context.delete(object)
        save()
    }
    
    func getAllWorkers() -> [BaseModel] {
        return fetch(BaseModel.self)
    }
}
