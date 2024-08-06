//
//  DetailTableViewController.swift
//  Collection_View_Table_View
//
//  Created by Karthikeyan.L on 06/08/24.
//

import UIKit

class DetailTableViewController: UIViewController {
    
    @IBOutlet weak var headerSection: UILabel!
    @IBOutlet weak var itemData: UILabel!
    
    
    var headerData: String?
    var detailedData: String?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // to display the data
        headerSection.text = headerData
        itemData.text = detailedData
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
