//
//  Tasks.swift
//  TaskTracker
//
//  Created by William Wood on 18/6/2026.
//



//Tasks class to store all homework task values and information in a way that is easy to call on and change - properties: taskName, taskDescription, taskClass, dueDate, priority - methods: toString() - used for testing values, showInfo() - used for displaying main values, showDetails() - used for displaying secondary values
class Task: Codable {
    
    //properties/attributes
    
    //taskName and taskDescription are private variables so that they are more secure. The other fields won't include private information that is harmful to be found by others, so they do not need to be private, for example if a due date and priority is found by someone else, that doesn't tell them anything about the person. Name and description however can potentially include private information if the user decides to write it in themselves. 
    
    //name of the task as a text value
    private var taskName: String
    //description of what the task involves as a text value
    private var taskDescription: String
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
    
    //toString method - brings values of a task which can be useful for testing, returning the string of all the values
    func toString() -> String {
        return "Task name: \(self.taskName), \n Task description: \(self.taskDescription), \n Task Class: \(self.taskClass), \n Due date: \(self.dueDate), \n Priority: \(self.priority)"
    }
    
    //showInfo method - shows primay information about tasks for displaying, returning the string of main information
    func showInfo() -> String {
        
        //reads field to see if it needs to say "due today", "overdue by x days" or in the case that it is in 1 day or overdue by 1 day displays "1 day" instead of "1 days"
        if dueDate == 0 {
            if priority == 1 {
                return "\(taskName) - due today | low priority"
            }
            else if priority == 2 {
                return "\(taskName) - due today | medium priority"
            }
            return "\(taskName) - due today | high priority"
        }
        else if dueDate == -1 {
            //for displaying overdue tasks better
            let dueDateVisual: Int = dueDate * -1
            
            if priority == 1 {
                return "\(taskName) - overdue by \(dueDateVisual) day | low priority"
            }
            else if priority == 2 {
                return "\(taskName) - overdue by \(dueDateVisual) day | medium priority"
            }
            return "\(taskName) - overdue by \(dueDateVisual) day | high priority"
        }
        else if dueDate < -1 {
            //for displaying overdue tasks better
            let dueDateVisual: Int = dueDate * -1
            
            if priority == 1 {
                return "\(taskName) - overdue by \(dueDateVisual) days | low priority"
            }
            else if priority == 2 {
                return "\(taskName) - overdue by \(dueDateVisual) days | medium priority"
            }
            return "\(taskName) - overdue by \(dueDateVisual) days | high priority"
        }
            
        if priority == 1 && dueDate == 1 {
            return "\(taskName) - due in \(dueDate) day | low priority"
        }
        else if priority == 2 && dueDate == 1 {
            return "\(taskName) - due in \(dueDate) day | medium priority"
        }
        else if priority == 3 && dueDate == 1 {
            return "\(taskName) - due in \(dueDate) day | high priority"
        }
        
        if priority == 1 {
            return "\(taskName) - due in \(dueDate) days | low priority"
        }
        else if priority == 2 {
            return "\(taskName) - due in \(dueDate) days | medium priority"
        }
        return "\(taskName) - due in \(dueDate) days | high priority"
    }
    
    //showDetails method - shows other more detailed information not included in the above example, returning a string of the details
    func showDetails() -> String {
        return "\(taskClass) - \(taskDescription)"
    }
    
    
}

//creates global array of tasks to store all inputted tasks, being a part of the object Task. Values are stored and retrieved for whole class calculations
var tasks: [Task] = []
