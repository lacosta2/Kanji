//
//  DefinitionViewController.swift
//  Kanji
//
//  Created by Luis Acosta on 8/5/22.
//

import UIKit



class DefinitionViewController: UIViewController {
    
    
    private let definition:UILabel = {
        let definition = UILabel()
        definition.translatesAutoresizingMaskIntoConstraints = false
        definition.text = "Test"
        definition.textAlignment = .center
        definition.font = definition.font.withSize(26)
        return definition
    }()
    
    private func labelConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(definition.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(definition.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70))
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let anonymousFunction = { (fetchedKanjiResults: KanjiResults) in
            DispatchQueue.main.async {
                
            }
        }
        AppAPI.shared.fetchAPI(onCompletion: anonymousFunction)
        view.addSubview(definition)
        labelConstraints()
    }

}
