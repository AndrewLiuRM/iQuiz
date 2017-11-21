//
//  PopoverViewController.swift
//  iQuiz
//
//  Created by 刘睿铭 on 11/19/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    var dir:URL?
    var mainController: ViewController?
    
    @IBAction func check(_ sender: Any) {
        if input.text != nil {
            getJsonFromUrl()
            mainController!.readFromFile()
            mainController!.table.reloadData()
        }
    }
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this function is fetching the json from URL
    func getJsonFromUrl(){
        let urlString = URL(string: input.text!)
        NSLog(input.text!)
//        let urlString = URL(string: "http://tednewardsandbox.site44.com/questions.json")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
//                    if self.dir != nil {
//                        self.readFromFile()
//                    }
                } else {
                    if let usableData = data {
                        if (response as! HTTPURLResponse).statusCode == 200 {
                            self.writeToFile(content: String(data: usableData, encoding: .utf8)!)
                        } else {
                            NSLog("fail")
                        }
                        //self.readFromFile()
                        //                        let json = try? JSONSerialization.jsonObject(with: usableData, options: []) as! [Any]
                        //                        self.fillList(json!)
                        //                        if json != nil {
                        //                            self.list = [:]
                        //                            self.data = []
                        //                            for values in json! {
                        //                                var myValue = values as! [String:Any]
                        //                                self.data.append(Cell(title: myValue["title"] as! String, description: myValue["desc"] as! String, image: nil))
                        //                                let questionlist = myValue["questions"] as! [Any]
                        //                                self.list![(myValue["title"] as! String)] = QuestionList(json: questionlist)
                        //                            }
                        //                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func writeToFile(content: String) {
        let str = content
        let filename = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("output.txt")
        self.dir = filename
        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
    }
    
//    func readFromFile() {
//        do {
//            let text2 = try String(contentsOf: dir!, encoding: .utf8)
//            let data = text2.data(using: String.Encoding.utf8)!
//            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [Any]
//            self.fillList(json)
//        }
//        catch {/* error handling here */}
//    }
    
//    func fillList(_ json: [Any]?) {
//        if json != nil {
//            self.list = [:]
//            self.data = []
//            for values in json! {
//                var myValue = values as! [String:Any]
//                self.data.append(Cell(title: myValue["title"] as! String, description: myValue["desc"] as! String, image: nil))
//                let questionlist = myValue["questions"] as! [Any]
//                self.list![(myValue["title"] as! String)] = QuestionList(json: questionlist)
//            }
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
