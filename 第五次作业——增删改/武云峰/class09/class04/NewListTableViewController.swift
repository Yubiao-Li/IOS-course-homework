//
//  NewListTableViewController.swift
//  class04
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wyf. All rights reserved.
//

import UIKit

class NewListTableViewController: UITableViewController {

    var carList: [car] = [car]()
    
    func initcarList (){
        carList.append(car(name: "benz", desc: "white"))
        carList.append(car(name: "toyota", desc: "gray"))
    }
    
    /*func saveCarFile(){
        let success = NSKeyedArchiver.archiveRootObject(carList, toFile: car.ArchiveURL.path)
        if !success{
            print("Failed")
        }
    }
    func loadCarFile()->[car]?{
        return (NSKeyedArchiver.unarchiveObject(withFile:car.ArchiveURL.path) as? [car])
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        initcarList()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = carList[indexPath.row].name

 
        return cell
    }
    
    @IBAction func cancelToList(segue: UIStoryboardSegue){
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func saveToList(segue: UIStoryboardSegue){
        if let addCarVC = segue.source as? CarViewController{
            if let addCar = addCarVC.carForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    carList[(selectedIndexPath as NSIndexPath).row] = addCar
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    carList.append(addCar)
                    let newIndexPath = IndexPath(row: carList.count-1,
                                                 section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carList.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?)
    {
      
            let descriptionVC = segue.destination as! CarViewController
            if let selectedCell = sender as?
                UITableViewCell{
                let indexPath = tableView.indexPath(for: selectedCell)!
               let selectedCar =  carList[(indexPath as NSIndexPath).row]
                
                descriptionVC.carForEdit = selectedCar
            }
            
        
    }

}
