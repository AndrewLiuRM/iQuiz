//
//  ViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/1/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBAction func SettingBtnClick(_ sender: Any) {
        let alertVC = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            alertVC.dismiss(animated: true)
        })
        self.present(alertVC, animated: true)

    }
    var data:[Cell] = []
    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseTableViewCell", for: indexPath) as? ReuseTableViewCell
        let text = data[indexPath.row]
        cell?.myImage.image = UIImage(named: text.image)
        cell?.Description.text = text.description
        cell?.Title.text = text.title
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(Cell(title: "Mathematics", description: "content", image: "math"))
        data.append(Cell(title: "Marvel Super Heros", description: "content", image: "marvel"))
        data.append(Cell(title: "Science", description: "content", image: "science"))
        NSLog("\(data.count)")
        table.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

