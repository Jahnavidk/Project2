//
//  ViewController.swift
//  Project2
//
//  Created by Krishnaiah, Jahnavi (Contractor) on 2/26/18.
//  Copyright © 2018 Comcast. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score: Int = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.darkGray.cgColor
        button2.layer.borderColor = UIColor.darkGray.cgColor
        button3.layer.borderColor = UIColor.darkGray.cgColor

        
        self.askQuestion(action: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }


    @IBAction func onClick(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let alert = UIAlertController.init(title: "\(title)", message: "Your score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alert, animated: true, completion: nil)
    }
}

