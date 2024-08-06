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
    
    let country = [ Continentals(name: "Asia", Country: ["China", "India", "Japan", "Malaysia"]),
                    Continentals(name: "Africa", Country: ["Southafrica", "Cameron", "Egypt", "Ghana"]),
                    Continentals(name: "Europe", Country: ["Russia", "Ukraine", "France", "Sweden"]),
                    Continentals(name: "North America", Country: ["Canada", "USA", "GreenLand", "Mexico"])
                  ]
    
    let bgImages = ["1", "2", "3", "4", "5", "6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling the delegate and dataSource
        
           collectionView.dataSource = self
           collectionView.delegate = self
        
            tableView.dataSource = self
            tableView.delegate = self
        
        // Register the Cells according to the Collection View and Table View
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    
    


}

// TableView Datasource, Delegate methods

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
   
    // DataSource Method
    // used to set the section
    
    
  
//---------------------------------------------------//
    // used to define the rows for header section
    func numberOfSections(in tableView: UITableView) -> Int {
            return country.count
    }
    
    // used to display the header name in the section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("TITle header: =====> \(section)")
        return country[section].name
       }
//----------------------------------------------------------//
   
    
    // DataSource Method
    
    
    // used to provide define the Rows section for the items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("====\(section)")
        return country[section].Country.count
    }
    
    // used to display the item names in the Labelcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        print("Cell: \(cell)")
        cell.CountryLabel.text = country[indexPath.section].Country[indexPath.row]
        return cell
    }
    
    // it is used to section provide section height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    
    
}
    
    
extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // DataSource Protocol
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bgImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: bgImages[indexPath.row])
        return cell
    }
    
    // use to set the cell width and height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Set the size of the cell
            return CGSize(width: 100 , height: 100) // Adjust the size as needed
        }
    
    //
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        print("----------> \(selectedIndex)")
        let selectedImage = bgImages[selectedIndex]
        print("----------> \(selectedImage)")
        
       
           
        }
        
    }
    
    

