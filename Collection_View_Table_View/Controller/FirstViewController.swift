//
//  ViewController.swift
//  Collection_View_Table_View
//
//  Created by Karthikeyan.L on 05/08/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // Creating Array Dictionary
    var country = [ Continentals(name: "Asia", Country: ["China", "India", "Japan", "Malaysia"]),
                    Continentals(name: "Africa", Country: ["Southafrica", "Cameron", "Egypt", "Ghana"]),
                    Continentals(name: "Europe", Country: ["Russia", "Ukraine", "France", "Sweden"]),
                    Continentals(name: "North America", Country: ["Canada", "USA", "GreenLand", "Mexico"])
    ]
    // creating the array of images
    let bgImages = ["1", "2", "3", "4", "5", "6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling the delegate and dataSource for CollectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Calling the delegate and datasource for TableView
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register the CollectionView cell in the CollectionView
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        // Register the TableViewcell in the TableView
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }
    
    // MARK: Using the Function to Navigate the Viewcontroller from CollectionViewscreen to Detailedscreen (For CollectionView Purpose)
    // Also Assign the images index value  to another viewcontroller variables
    
    func moveToSecondVC (selectedIndex: Int, selectedImages: String ) {
        let detailedView = DetailedView()
        detailedView.imageview =  selectedImages
        self.navigationController?.pushViewController(detailedView, animated: true)
        
    }
    // MARK: Using the Function to navigate the Viewcontroller from TableViewscreen to Detailedscreen( For TableView Purpose)
    //  Also Assign the HeaderSection Value and Item value to another viewcontroller variables
    
    func moveToTableVC(_ value: IndexPath) {
        
        let tableDetailView = DetailTableViewController()
        tableDetailView.headerData = country[value.section].name
        tableDetailView.detailedData = country[value.section].Country[value.row]
        navigationController?.pushViewController(tableDetailView, animated: true)
    }
    
    
}




// MARK: TableView Datasource, Delegate methods

extension FirstViewController: UITableViewDataSource {
    
    // MARK: Datasource Method:
    // used to define the rows for header section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return country.count
    }
    
    // MARK: Datasource Method:
    // used to display the header titlename in the each section
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        print("TITle header: =====> \(section)")
        return country[section].name
    }
    
    
    
    // MARK: Datasource Method:
    // used to define the Rows section for the items
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("====\(section)")
        return country[section].Country.count
    }
    
    // MARK: Datasource Method:
    // used to display the item names in the Labelcell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        print("Cell: \(cell)")
        cell.CountryLabel.text = country[indexPath.section].Country[indexPath.row]
        return cell
    }
    
    // MARK: Datasource Method:
    // use to delete the particular item in the tableview row and the data from the datasource
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if  editingStyle == .delete {
            // remove the item from the data source
            country[indexPath.section].Country.remove(at: indexPath.row)
            //Delete the row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
}


extension FirstViewController: UITableViewDelegate {
    
    // MARK: Delegate Method:
    // it is used to provide each section height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    // MARK: Delegate Method:
    // when user select the particular section that row index value we can get here
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("newwwwwww:  \(indexPath)")
        self.moveToTableVC(indexPath)
    }
}




extension FirstViewController: UICollectionViewDataSource {
    
    // MARK:  DataSource Method:
    // Used to define the section
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bgImages.count
    }
    
    // MARK:  DataSource Method:
    // Used to set the value for the cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: bgImages[indexPath.row])
        return cell
    }
    
}


extension FirstViewController: UICollectionViewDelegate {
    
    
    // MARK: Delegate Method:
    // Used to whatever the user select the item the particular index will be appear using in this method
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedIndex = indexPath.row
        print("----------> \(selectedIndex)")
        let selectedImage = bgImages[selectedIndex]
        print("----------> \(selectedImage)")
        
        self.moveToSecondVC(selectedIndex: selectedIndex, selectedImages: selectedImage)
        
    }
}



extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: DelegateFlowLayout Method:
    // use to set the cell layout width and height
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set the size of the cell
        return CGSize(width: 100 , height: 100) // Adjust the size as needed
    }
}



