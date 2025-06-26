//
//  AdventureLogic.swift
//  Adventure
//
//  Created by Garrett Li on 6/25/25.
//

import Foundation

struct AdventureLogic {
    private let choices: [AdventureChoice] = [
        AdventureChoice(title: "You crash-landed in the jungle. What do you do?",
                        nextIndices: [1, 4], isSuccessfulEnd: nil),
        AdventureChoice(title: "Follow the river downstream",
                        nextIndices: [2, 3], isSuccessfulEnd: nil),
        AdventureChoice(title: "Find a village", nextIndices: nil, isSuccessfulEnd: true),
        AdventureChoice(title: "Meet crocodiles", nextIndices: nil, isSuccessfulEnd: false),
        AdventureChoice(title: "Climb a tree to get your bearings",
                        nextIndices: [5, 6], isSuccessfulEnd: nil),
        AdventureChoice(title: "Spot a helicopter", nextIndices: nil, isSuccessfulEnd: true),
        AdventureChoice(title: "Fall and injure yourself", nextIndices: nil, isSuccessfulEnd: false)
    ]

    private(set) var currentIndex: Int = 0

    func currentChoice() -> AdventureChoice {
        return choices[currentIndex]
    }

    func getChoiceTitle(at index: Int) -> String? {
        guard let nextIndices = choices[currentIndex].nextIndices,
              nextIndices.indices.contains(index) else {
            return nil
        }
        return choices[nextIndices[index]].title
    }

    mutating func selectChoice(at index: Int) {
        guard let nextIndices = choices[currentIndex].nextIndices,
              nextIndices.indices.contains(index) else {
            return
        }
        currentIndex = nextIndices[index]
    }

    mutating func reset() {
        currentIndex = 0
    }
}
