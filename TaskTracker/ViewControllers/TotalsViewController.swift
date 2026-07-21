//
//  TotalsViewController.swift
//  TaskTracker
//
//  Created by William Wood on 9/6/2026.
//

import UIKit

class TotalsViewController: UIViewController {
    
    //outputs
    
    @IBOutlet weak var lblNumberTasks: UILabel!
    
    @IBOutlet weak var lblOverdue: UILabel!
    
    @IBOutlet weak var lblCloseDeadline: UILabel!
    
    @IBOutlet weak var lblLongDeadline: UILabel!
    
    @IBOutlet weak var lblLowPriority: UILabel!
    
    @IBOutlet weak var lblMediumPriority: UILabel!
    
    @IBOutlet weak var lblHighPriority: UILabel!
    
    /*
     Calculate function - calculates information for the number of tasks, how many overdue tasks, closest and longest deadlines as well as the low, medium and high amounts of tasks
     */
    func calculate() {
        
        //sets values for calculations all to 0
        var numOverdue: Int = 0
        var lowDeadline: Int = 365
        var highDeadline: Int = -1
        var numLowPriority: Int = 0
        var numMediumPriority: Int = 0
        var numHighPriority: Int = 0
        
        //for loop to look through the entire eachTask array to calculate totals and information
        for eachTask in tasks {
            if eachTask.dueDate < 0 {
                numOverdue += 1
            }
            //makes sure that it wont display overdue tasks as the next thing due for easier understandability. Overdue tasks are already displayed so the next not overdue task is more useful information
            if eachTask.dueDate < lowDeadline && eachTask.dueDate >= 0 {
                lowDeadline = eachTask.dueDate
            }
            if eachTask.dueDate > highDeadline {
                highDeadline = eachTask.dueDate
            }
            if eachTask.priority == 1 {
                numLowPriority += 1
            }
            if eachTask.priority == 2 {
                numMediumPriority += 1
            }
            if eachTask.priority == 3 {
            numHighPriority += 1
            }
        }

        //displays all found values
        lblNumberTasks.text = "\(tasks.count)"
        lblOverdue.text = "\(numOverdue)/\(tasks.count)"
        //if the low or high deadlines are today, say "Due today", otherwise say how long until it is due
        if lowDeadline == 0 {
            lblCloseDeadline.text = "Due today"
        }
        else if lowDeadline == 365 {
            lblCloseDeadline.text = ""
        }
        else {lblCloseDeadline.text = "\(lowDeadline) days"
        }
        if highDeadline == 0 {
            lblLongDeadline.text = "Due today"
        }
        else if highDeadline == -1 {
            lblCloseDeadline.text = ""
        }
        else {lblLongDeadline.text = "\(highDeadline) days"
        }
        //displays how many low, medium and high priority tasks out of total tasks
        lblLowPriority.text = "\(numLowPriority) / \(tasks.count)"
        lblMediumPriority.text = "\(numMediumPriority) / \(tasks.count)"
        lblHighPriority.text = "\(numHighPriority) / \(tasks.count)"
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //loads information to allow for calculations
        loadtoFile()
        //calculates values upon opening page
        calculate()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
