//
//  ViewController.swift
//  JSONDecoder
//
//  Created by USER on 3/19/19.
//  Copyright © 2019 mCubes. All rights reserved.
//

import UIKit

struct JasonStruct : Decodable {
    
    let name : String
    let capital : String
    let region : String
    let subregion : String
}


class ViewController : UIViewController,UITableViewDataSource,UITableViewDelegate {

    var arrayData = [JasonStruct]()
  
   
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      getDataFromCountryApi()
    }
    
    func getDataFromCountryApi(){
        
      
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            
            do{
                if error == nil{
                    
                self.arrayData = try
                    JSONDecoder().decode([JasonStruct].self, from: data!)
                    
                  
                    for mainArray in self.arrayData{
                        
                        print(mainArray.name)
                       
                    }
                    
                }
                
            }catch{
                
                
                print(error.localizedDescription)
            }
            
            
        }.resume()
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell :TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
         cell.lblName.text = arrayData[indexPath.row].name
        cell.lblCapital.text = arrayData[indexPath.row].capital
        
        return cell
        
        
    }
    
    
    
  
}

    















