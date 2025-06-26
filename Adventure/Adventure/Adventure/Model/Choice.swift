//
//  Choice.swift
//  Adventure
//
//  Created by Garrett Li on 6/25/25.
//


import Foundation

struct AdventureChoice {
    let title: String
    let nextChoices: [AdventureChoice]?
    let isSuccessfulEnd: Bool?
}
