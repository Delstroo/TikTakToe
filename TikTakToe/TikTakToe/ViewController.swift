//
//  ViewController.swift
//  TikTakToe
//
//  Created by Delstun McCray on 8/18/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Action
    @IBAction func spotButtonTapped(_ sender: UIButton) {
        print("\(sender.tag)")
    }
    
}

