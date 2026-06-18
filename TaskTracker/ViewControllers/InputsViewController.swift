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
    
    @IBOutlet weak var lblErrorName: UILabel!
    
    @IBOutlet weak var lblErrorDescription: UILabel!
    
    @IBOutlet weak var lblErrorClass: UILabel!
    
    @IBOutlet weak var lblErrorDueDate: UILabel!
    
    
    /*
     Add Task button
     */
    @IBAction func btnAdd(_ sender: Any) {
        
        
        
    }
    
    
    
    /*
     Clear button - clears all inputted values back to default stage
     */
    @IBAction func btnClear(_ sender: Any) {
        
        lblErrorName.text = ""
        lblErrorDescription.text = ""
        lblErrorClass.text = ""
        lblErrorDueDate.text = ""
        segPriority.selectedSegmentIndex = 0
        txtName.text = ""
        txtDescription.text = ""
        txtClass.text = ""
        txtDueDate.text = ""
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
