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
    

    var currentChoice: AdventureChoice?

    // Sample data tree
    let adventureStart = AdventureChoice(
        title: "You crash-landed in the jungle. What do you do?",
        nextChoices: [
            AdventureChoice(
                title: "Follow the river downstream",
                nextChoices: [
                    AdventureChoice(title: "Find a village", nextChoices: nil, isSuccessfulEnd: true),
                    AdventureChoice(title: "Meet crocodiles", nextChoices: nil, isSuccessfulEnd: false)
                ],
                isSuccessfulEnd: nil
            ),
            AdventureChoice(
                title: "Climb a tree to get your bearings",
                nextChoices: [
                    AdventureChoice(title: "Spot a helicopter", nextChoices: nil, isSuccessfulEnd: true),
                    AdventureChoice(title: "Fall and injure yourself", nextChoices: nil, isSuccessfulEnd: false)
                ],
                isSuccessfulEnd: nil
            )
        ],
        isSuccessfulEnd: nil
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        currentChoice = adventureStart
        updateUI()
    }

    func updateUI() {
        guard let choice = currentChoice else { return }
        Question.text = choice.title

        if let next = choice.nextChoices {
            Choice1.setTitle(next[0].title, for: .normal)
            Choice1.isHidden = false

            Choice2.setTitle(next[1].title, for: .normal)
            Choice2.isHidden = false
        } else {
            Choice1.isHidden = true
            Choice2.isHidden = true

            if choice.isSuccessfulEnd == true {
                Question.text = "Success! 🎉\n\(choice.title)"
            } else {
                Question.text = "You failed. ☠️\n\(choice.title)"
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.currentChoice = self.adventureStart
                        self.updateUI()
            }
        }
    }

    @IBAction func Choice1(_ sender: UIButton) {
        currentChoice = currentChoice?.nextChoices?[0]
        updateUI()
    }

    @IBAction func Choice2(_ sender: UIButton) {
        currentChoice = currentChoice?.nextChoices?[1]
        updateUI()
    }
}


