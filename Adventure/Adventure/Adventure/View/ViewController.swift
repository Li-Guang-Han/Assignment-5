//
//  ViewController.swift
//  Adventure
//
//  Created by Garrett Li on 6/25/25.
//

import UIKit

class AdventureViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!

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
        titleLabel.text = choice.title

        if let next = choice.nextChoices {
            choiceButton1.setTitle(next[0].title, for: .normal)
            choiceButton1.isHidden = false

            choiceButton2.setTitle(next[1].title, for: .normal)
            choiceButton2.isHidden = false
        } else {
            choiceButton1.isHidden = true
            choiceButton2.isHidden = true

            if choice.isSuccessfulEnd == true {
                titleLabel.text = "Success! 🎉\n\(choice.title)"
            } else {
                titleLabel.text = "You failed. ☠️\n\(choice.title)"
            }
        }
    }

    @IBAction func choice1Tapped(_ sender: UIButton) {
        currentChoice = currentChoice?.nextChoices?[0]
        updateUI()
    }

    @IBAction func choice2Tapped(_ sender: UIButton) {
        currentChoice = currentChoice?.nextChoices?[1]
        updateUI()
    }
}


