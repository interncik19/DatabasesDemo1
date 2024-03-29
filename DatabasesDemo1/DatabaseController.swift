import Foundation
import CoreData

class DatabaseController{
    
    private init(){
        
    }
    
    class func getContext() -> NSManagedObjectContext{
        return DatabaseController.persistentContainer.viewContext
    }
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "DatabasesDemo1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    class func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
