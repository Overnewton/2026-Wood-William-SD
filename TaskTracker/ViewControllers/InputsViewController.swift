//
//  InputsViewController.swift
//  TaskTracker
//
//  Created by William Wood on 9/6/2026.
//

import UIKit

class InputsViewController: UIViewController {
    
    //inputs
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtDescription: UITextField!
    
    @IBOutlet weak var txtClass: UITextField!
    
    @IBOutlet weak var txtDueDate: UITextField!
    
    @IBOutlet weak var segPriority: UISegmentedControl!
    
    
    //outputs
    
    @IBOutlet weak var lblError: UILabel!
    
    
    
    /*
     Add Task button - adds a new task to the list if the inputs are valid, otherwise displays an error message and doesn't append an invalid value
     */
    @IBAction func btnAdd(_ sender: Any) {
        
        //validation - ensures that the inputs are all valid and correct, displaying an error message to say what is wrong if it isn't
        
        //existence check - checks if something is entered into every field
        if txtName.text != "" && txtDescription.text != "" && txtClass.text != "" && txtDueDate.text != "" {
            
            //type check - checks if the due date is in days
            if Int(txtDueDate.text!) != nil {
                
                //range check - checks that the due date is a positive value
                if Int(txtDueDate.text!)! >= 0 {
                    
                    //reads text fields and assigns values
                    let inName: String = txtName.text!
                    let inDescription: String = txtDescription.text!
                    let inClass: String = txtClass.text!
                    let inDueDate: Int = Int(txtDueDate.text!)!
                    //reads and assigns priority value, assigning a numeric value for ease of calculations
                    var inPriority: Int = 1
                    switch segPriority.selectedSegmentIndex {
                    case 0:
                        inPriority = 1
                    case 1:
                        inPriority = 2
                    default:
                        inPriority = 3
                    }
                    
                    //declares a new task with all inputted values
                    let newTask: Task = Task(taskName: inName, taskDescription: inDescription, taskClass: inClass, dueDate: inDueDate, priority: inPriority)
                    
                    //appends value to the array
                    tasks.append(newTask)
                    
                    //sets all information to default state
                    txtName.text = ""
                    txtDescription.text = ""
                    txtClass.text = ""
                    txtDueDate.text = ""
                    segPriority.selectedSegmentIndex = 0
                    
                    //removes error message if working
                    lblError.text = ""
                    
                    //saves tasks using a save function
                    savetoFile()
                    
                }
                //range check failed - displays error message to user
                else {
                    lblError.text = "Please enter a positive due date amount"
                }
                
                
            }
            //type check failed - displays error message to user
            else {
                lblError.text = "Enter a number value for days until the task is due"
            }
            
            
        }
        //existence check failed - displays error message to user
        else {
            lblError.text = "Enter a value into all fields"
        }
        
        
        
        
        
    }
    
    
    
    /*
     Clear button - clears all inputted values back to default stage
     */
    @IBAction func btnClear(_ sender: Any) {
        
        lblError.text = ""
        segPriority.selectedSegmentIndex = 0
        txtName.text = ""
        txtDescription.text = ""
        txtClass.text = ""
        txtDueDate.text = ""
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //loads file
        loadtoFile()
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
