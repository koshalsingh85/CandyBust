//
//  FirstViewController.swift
//  CandyBust
//
//  Created by koshal singh shekhawat on 11/09/23.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.mainView.layer.cornerRadius = 10
        cell.photoView.layer.cornerRadius = 15
        cell.buttonView.layer.cornerRadius = 30
    
        tableView.separatorStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let next = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

        self.navigationController?.pushViewController(next, animated: true)
    }
}
