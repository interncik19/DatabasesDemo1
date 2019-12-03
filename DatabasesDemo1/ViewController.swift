//
//  ViewController.swift
//  DatabasesDemo1
//
//  Created by Trinidad Garcia on 02/03/18.
//  Copyright © 2018 Trinidad Garcia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let studentClassName:String = String(describing: Student.self)
        let courseClassName:String = String(describing: Course.self)
        
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: studentClassName, into: DatabaseController.getContext()) as! Student
        student.firstName = "Bruno Alexander"
        student.lastName = "Garcia Lopez"
        student.age = 18
        
        let course:Course = NSEntityDescription.insertNewObject(forEntityName: courseClassName, into: DatabaseController.getContext()) as! Course
        course.courseName = 10
        
        student.addToCourses(course)
        course.addToStudents(student)
        
        DatabaseController.saveContext()
        
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            print("numbers of results: \(searchResults.count)")
            
            for result in searchResults as [Student]{
                print("\(result.firstName!) \(result.lastName!) is \(result.age) ")
            }
        } catch {
            print("Error \(error)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

