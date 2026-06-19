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
        
        
        
    }
    
    
    
    /*
     Sort button - sorts all values in the list by the sort criteria, using a selection sort if there are less than 10 values, otherwise uses a quick sort
     */
    @IBAction func btnSort(_ sender: Any) {
        
        
        
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
        
        cell.textLabel?.text = display.showInfo()
        
        cell.detailTextLabel?.text = display.showDetails()

        return cell

    }
    
    
    //swipe to delete to remove tasks from table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {   if editingStyle == .delete {      tasks.remove(at: indexPath.row)   }
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
