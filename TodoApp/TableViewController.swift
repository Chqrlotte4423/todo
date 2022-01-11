//
//  TableViewController.swift
//  TodoApp
//
//  Created by 三浦拓真 on 2021/06/10.
//

import UIKit

class TableViewController: UITableViewController {
    
    var titleArray = [String]()
    var memoArray = [String]()
    let userDefaults = UserDefaults.standard
    var memories = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstMemories = self.userDefaults.object(forKey: "TodoApp"){
            
            memories = firstMemories as! [[String]]
            titleArray = memories[0]
            memoArray = memories[1]
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "nextSegue" {
            
            let screen2 = segue.destination as! ViewController
            
            screen2.takeTitle = self.titleArray[(self.tableView.indexPathForSelectedRow?.row)!]
            screen2.takeText = self.memoArray[(self.tableView.indexPathForSelectedRow?.row)!]
            screen2.takeNum = self.tableView.indexPathForSelectedRow?.row
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memoArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)

        cell.textLabel?.text = titleArray[indexPath.row]
        //データを保存する配列を一つの配列にまとめる処理
        memories = [titleArray, memoArray]
        self.userDefaults.set(memories, forKey: "TodoApp")
        // Configure the cell...

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
            titleArray.remove(at: indexPath.row)
            memoArray.remove(at: indexPath.row)
            memories = [titleArray, memoArray]
            self.userDefaults.set(memories, forKey: "TodoApp")
            tableView.deleteRows(at: [indexPath], with: .fade)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
