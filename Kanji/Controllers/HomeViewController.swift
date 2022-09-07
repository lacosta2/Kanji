//
//  HomeViewController.swift
//  Kanji
//
//  Created by Luis Acosta on 8/5/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let welcomeLabel:UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "こんにちは"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = welcomeLabel.font.withSize(36)
        return welcomeLabel
    }()
    
    private let message:UILabel = {
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.text = "Kanji of the day is "
        message.textAlignment = .center
        message.font = message.font.withSize(26)
        return message
    }()
    
    private let mainKanji:UILabel = {
        let mainKanji = UILabel()
        mainKanji.translatesAutoresizingMaskIntoConstraints = false
        mainKanji.text = "\(String(kanjiOfTheDay))"
        mainKanji.textAlignment = .center
        mainKanji.font = mainKanji.font.withSize(60)
        return mainKanji
    }()
    

    private func labelConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70))
        constraints.append(message.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(message.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20))
        constraints.append(mainKanji.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(mainKanji.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60))
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(message)
        view.addSubview(mainKanji)
        labelConstraints()
    }
}


