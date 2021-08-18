//
//  ViewController.swift
//  TikTakToe
//
//  Created by Delstun McCray on 8/18/21.
//

import UIKit

class ViewController: UIViewController {

    var tikTakToe = TikTakToe()
    
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBoard()
    }
    
    //MARK: - Action
    @IBAction func spotButtonTapped(_ sender: UIButton) {
        if sender.title(for: .normal) != "?" {
            return
        }
        var buttonNameValue: String
        var buttonBoardValue: Int
        
        switch tikTakToe.checkStatus() {
        case .xTurn:
            buttonNameValue = "X"
            buttonBoardValue = 1
        case .oTurn:
            buttonNameValue = "O"
            buttonBoardValue = 2
        default:
            buttonNameValue = "?"
            buttonBoardValue = 0
        }
        tikTakToe.board[(sender.tag-1)/3][(sender.tag-1)%3]  = buttonBoardValue
        sender.setTitle(buttonNameValue, for: .normal)
        updateBoard()

    }//end of func
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        tikTakToe.resetBoard()
        for i in 1...9 {
            let button = self.view.viewWithTag(i) as! UIButton
            button.setTitle("?", for: .normal)
        }
        updateBoard()
    }
    
    
    func updateBoard() {
        print(tikTakToe.checkStatus().rawValue)
        if tikTakToe.checkStatus().rawValue == "O's Win!"{
            self.showAlert(status: "Congrats! O's Win!")
        
        } else if tikTakToe.checkStatus().rawValue == "X's Win!" {
            self.showAlert(status: "Congrats! X's Win!")
            
        } else if tikTakToe.checkStatus().rawValue == "Tie Game." {
            self.showAlert(status: "Whoops. Looks like you tied :(")
        }
    }
    
    func showAlert(status: String) {
        let alert = UIAlertController(title: "TikTakToe! Are you ready for another duel?", message: status, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "I'm ready!", style: UIAlertAction.Style.default))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

