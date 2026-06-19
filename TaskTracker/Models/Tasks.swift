//
//  Tasks.swift
//  TaskTracker
//
//  Created by William Wood on 18/6/2026.
//



//Tasks class to store all homework task values and information in a way that is easy to call on and change
class Task: Codable {
    
    //properties/attributes
    
    //name of the task as a text value
    var taskName: String
    //description of what the task involves as a text value
    var taskDescription: String
    //what class / subject the task is for as a text value
    var taskClass: String
    //how many days until the task is due as an integer as it is a direct day count
    var dueDate: Int
    //priority of the task (low/medium/high) - this is an integer for ease of calculations, as sorting through the number order of importance is faster and simpler
    var priority: Int
    
    //initialiser
    init(taskName: String, taskDescription: String, taskClass: String, dueDate: Int, priority: Int) {
        self.taskName = taskName
        self.taskDescription = taskDescription
        self.taskClass = taskClass
        self.dueDate = dueDate
        self.priority = priority
    }
    
    //methods
    
    //toString method - brings values of a task which can be useful for testing
    func toString() -> String {
        return "Task name: \(self.taskName), \n Task description: \(self.taskDescription), \n Task Class: \(self.taskClass), \n Due date: \(self.dueDate), \n Priority: \(self.priority)"
    }
    
    //showInfo method - shows primay information about tasks for displaying
    func showInfo() -> String {
        return "\(taskName) for \(taskClass) due in \(dueDate) days | \(priority) priority"
    }
    
    //showDetails method - shows other more detailed information not included in the above example
    func showDetails() -> String {
        return "Description: \(taskDescription)"
    }
    
    
}

//creates global array of tasks to store all inputted tasks, being a part of the object Task. Values are stored and retrieved for whole class calculations
var tasks: [Task] = []
