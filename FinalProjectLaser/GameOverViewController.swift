//
//  GameOverViewController.swift
//  FinalProjectLaser
//
//  Created by Livleen Rai on 2017-09-19.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

//
//  GameOverViewController.swift
//  FinalProjectLaser
//
//  Created by Livleen Rai on 2017-09-13.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//PFObject *recipe = [PFObject objectWithClassName:@"Recipe"];
//[recipe setObject:_nameTextField.text forKey:@"name"];
//[recipe setObject:_prepTimeTextField.text forKey:@"prepTime"];

import UIKit
import SpriteKit
import GameplayKit
import Parse

class GameOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var leaderBoardTableView: UITableView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    var score: Int = 0
    var leaderboardRankings:Array<PFObject>? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults:UserDefaults = UserDefaults.standard
        self.score = defaults.integer(forKey: "userScore")
        self.scoreLabel.text = String(self.score)
        queryDatabase()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        nameTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    func sortRankings() {
        self.leaderboardRankings = self.leaderboardRankings?.sorted(by:
            {   (rank1,rank2) -> Bool in
                if (rank1["score"] as! Int > rank2["score"] as! Int) {
                    return true
                }else {
                    return false
                }
        })
    }
    
    
    func savePlayerScore() {
        
        let highScore:PFObject = PFObject(className: "Player")
        highScore.setObject(self.nameTextField.text!, forKey: "name")
        highScore.setObject(self.score, forKey: "score")
        highScore.saveInBackground(block: { (success, error) in
            if success {
                self.leaderboardRankings?.append(highScore)
                self.sortRankings()
                self.leaderBoardTableView?.reloadData()
            } else {
                print(error!)
            }
        })
        
    }
    
    func queryDatabase() {
        
        let query = PFQuery(className: "Player")
        
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                if let pfObjects = objects {
                    for object in pfObjects {
                        self.leaderboardRankings?.append(object)
                    }
                }
                self.sortRankings()
                self.leaderBoardTableView?.reloadData()
            } else {
                print(error!)
            }
            
        }
        
    }
    
    
    
    @IBAction func mainMenu(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        Laser.leftLaserMovementSpeed = 4.0
        LaserRight.rightLaserMovementSpeed = 4.0
    }
    
    
    @IBAction func submit(_ sender: Any) {
        savePlayerScore()
    }
    
    // MARK: - TableView
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leaderboardRankings!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let leaderBoardCell = leaderBoardTableView.dequeueReusableCell(withIdentifier: "leaderboardCell", for: indexPath) as! LeaderBoardTableViewCell
        
        let player: PFObject = leaderboardRankings![indexPath.row]
        
        leaderBoardCell.name = player.object(forKey: "name") as! String
        leaderBoardCell.score = player.object(forKey: "score") as! Int
        leaderBoardCell.setLabels()
        
        return leaderBoardCell
        
    }
    
    
}

