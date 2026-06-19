//
//  ListViewController.swift
//  TaskTracker
//
//  Created by William Wood on 9/6/2026.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //inputs
    
    @IBOutlet weak var segSort: UISegmentedControl!
    
    //outputs
    
    @IBOutlet weak var tblTasks: UITableView!
    
    
    /*
     Remove Day button - removes a day from all values in the array and updates the list
     */
    @IBAction func btnRemoveDay(_ sender: Any) {
        
        //for loop that goes through the whole array removing a day from all values
        for eachTask in tasks {
            eachTask.dueDate -= 1
        }
        //saves change
        savetoFile()
        //reloads table changes
        tblTasks.reloadData()
        
    }
    
    
    
    /*
     Sort button - sorts all values in the list by the sort criteria, using a selection sort if there are less than 10 values, otherwise uses a quick sort
     */
    @IBAction func btnSort(_ sender: Any) {
        
        //due date sort criteria selected
        if segSort.selectedSegmentIndex == 0 {
            //selections sort if there are less than 10 values in the array
            if tasks.count < 10 {
                tasks = selectionSortDueDate(array: tasks)
            }
            //quick sort if there are 10 or more values in the array
            else {
                tasks = quickSortDueDate(array: tasks)
            }
        }
        
        //priority sort criteria selected
        else if segSort.selectedSegmentIndex == 1 {
            //selections sort if there are less than 10 values in the array
            if tasks.count < 10 {
                tasks = selectionSortPriority(array: tasks)
            }
            //quick sort if there are 10 or more values in the array
            else {
                tasks = quickSortPriority(array: tasks)
            }
        }
        
        //class sort criteria selected
        else if segSort.selectedSegmentIndex == 2 {
            //selections sort if there are less than 10 values in the array
            if tasks.count < 10 {
                tasks = selectionSortClass(array: tasks)
            }
            //quick sort if there are 10 or more values in the array
            else {
                tasks = quickSortClass(array: tasks)
            }
        }
        
        //reloads table
        tblTasks.reloadData()
    }
    
    
    //MARK: Helper functions
    
    //tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //ensure the cell identifier has been labelled "cell"

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let display = tasks[indexPath.row]
        
        //colouring - if the task is overdue, show red background. If its priority is low, then if the due date is 2 or less days it displays in red, 5 or less days orange, otherwise green. Medium priority will have 3 or less days red, 7 or less days orange, otherwise green. High priority will have 5 or less days red, 14 or less days (2 weeks) orange, otherwise show green. This makes it so that depending on the priority, as the due date gets closer the background colour can change to stand out more, with higher priorities showing more importance sooner. 
        if display.dueDate <= 0 {
            cell.backgroundColor = UIColor.red
        }
        else if display.priority == 1 {
            if display.dueDate <= 2 {
                cell.backgroundColor = UIColor.red
            }
            else if display.dueDate <= 5 {
                cell.backgroundColor = UIColor.orange
            }
            else {
                cell.backgroundColor = UIColor.green
            }
        }
        else if display.priority == 2 {
            if display.dueDate <= 3 {
                cell.backgroundColor = UIColor.red
            }
            else if display.dueDate <= 7 {
                cell.backgroundColor = UIColor.orange
            }
            else {
                cell.backgroundColor = UIColor.green
            }
        }
        else if display.priority == 3 {
            if display.dueDate <= 5 {
                cell.backgroundColor = UIColor.red
            }
            else if display.dueDate <= 14 {
                cell.backgroundColor = UIColor.orange
            }
            else {
                cell.backgroundColor = UIColor.green
            }
        }
        
        
        cell.textLabel?.text = display.showInfo()
        
        cell.detailTextLabel?.text = display.showDetails()

        return cell

    }
    
    
    //swipe to delete to remove tasks from table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {   if editingStyle == .delete {      tasks.remove(at: indexPath.row)   }
        //saves new state with deleted value and updates the table
        savetoFile()
        tblTasks.reloadData()
    }
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblTasks.delegate = self
        tblTasks.dataSource = self
        
        //loads tasks from the json and updates the table
        loadtoFile()
        tblTasks.reloadData()
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
