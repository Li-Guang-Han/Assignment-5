//
//  ViewController.swift
//  Adventure
//
//  Created by Garrett Li on 6/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIStackView!
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var Choice1: UIButton!
    @IBOutlet weak var Choice2: UIButton!
    
    
    var adventureLogic = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let current = adventureLogic.currentChoice()
        Question.text = current.title
        
        if let _ = current.nextIndices {
            Choice1.isHidden = false
            Choice2.isHidden = false
            
            Choice1.setTitle(adventureLogic.getChoiceTitle(at: 0), for: .normal)
            Choice2.setTitle(adventureLogic.getChoiceTitle(at: 1), for: .normal)
        } else {
            Choice1.isHidden = true
            Choice2.isHidden = true
            
            if current.isSuccessfulEnd == true {
                Question.text = "Success! 🎉\n\(current.title)"
            } else {
                Question.text = "You failed. ☠️\n\(current.title)"
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.adventureLogic.reset()
                self.updateUI()
            }
        }
    }
    
    
    @IBAction func Choice1UPD(_ sender: Any) {
        adventureLogic.selectChoice(at: 0)
        updateUI()
    }
    
    
    @IBAction func CHoice2UPD(_ sender: Any) {
        adventureLogic.selectChoice(at: 1)
        updateUI()
    }
    
}
