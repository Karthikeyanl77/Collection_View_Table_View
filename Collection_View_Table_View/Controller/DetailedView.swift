//
//  DetailedView.swift
//  Collection_View_Table_View
//
//  Created by Karthikeyan.L on 05/08/24.
//

import UIKit

class DetailedView: UIViewController {

    @IBOutlet weak var image1View: UIImageView!
    
    var imageview: String!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.image1View?.image = UIImage(named: imageview)

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
