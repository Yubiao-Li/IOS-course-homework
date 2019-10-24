//
//  FoodListTableViewController.swift
//  第四次作业——outlet
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Mei.class5.edu. All rights reserved.
//

import UIKit

class FoodListTableViewController: UITableViewController {
    
    var foodList:[Food] = [Food]()
    
    func initFoodList() {
        if let localfoodList = loadFoodFile(){
            if localfoodList.count != 0{
                self.foodList = localfoodList
            }else{
                foodList.append(Food(name: "cake", desc: "sweet"))
                foodList.append(Food(name: "hamburger", desc: "meat"))
            }
        }
        
    }
    
    func saveFoodFile(){
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: Food.ArchiveURL.path)
        if !success{
            print("Failed...")
        }
    }
    
    func loadFoodFile() -> [Food]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Food.ArchiveURL.path) as? [Food])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initFoodList()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

//         Configure the cell...
        cell.textLabel?.text = "\(foodList[indexPath.row].name!)"
        cell.detailTextLabel?.text = "\(foodList[indexPath.row].desc!)"
        return cell
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
            // Delete the row from the data source
            foodList.remove(at: indexPath.row)
            saveFoodFile()
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
    
    @IBAction func cancelToList(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func saveToList(segue: UIStoryboardSegue){
        if let addFoodVC = segue.source as? DescViewController{
            if let addFood = addFoodVC.foodForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    foodList[(selectedIndexPath as NSIndexPath).row] = addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    foodList.append(addFood)
                    let newIndexPath = IndexPath(row:foodList.count - 1,section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
                saveFoodFile()
            }
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let descVC = segue.destination as! DescViewController
        if let selectedCell = sender as? UITableViewCell{
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedFood = foodList[(indexPath as NSIndexPath).row]
            descVC.foodForEdit = selectedFood
        }
    }
}
