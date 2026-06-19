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
