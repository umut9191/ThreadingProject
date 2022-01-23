//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Mac on 23.01.2022.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    var data = Data()
    var urlStrings = ["https://assets.entrepreneur.com/content/3x2/2000/20200429211042-GettyImages-1164615296.jpeg","https://global-uploads.webflow.com/5e2d970a86f417102b21abd2/5fb6272c50c16ac33c0e1b06_5f92b527aee25a8c3463dac7_5eaace7e60a79172b8c90108_Blog%2520Hero%2520Image%2520Template%2520(4)-2.jpeg"]
    var tracker = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.dataSource = self
        tblView.delegate = self
        do {
              data = try Data(contentsOf: URL(string: urlStrings[tracker])!)
            imgView.image = UIImage(data: data)
        } catch  {
            print("some error occur\(error)")
        }
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(navigatorBarButtonPressed))
        
    }
    @objc  func navigatorBarButtonPressed(){
        if tracker == 0 {
            tracker = 1
        }else {
            tracker = 0
        }
        do {
              data = try Data(contentsOf: URL(string: urlStrings[tracker])!)
            imgView.image = UIImage(data: data)
        } catch  {
            print("some error occur\(error)")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }

}

