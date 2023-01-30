//
//  MainScreenTableViewCell.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {

    // MARK: - Constants

    static let identifier: String = "\(MainScreenTableViewCell.self)"
    static let height: CGFloat = 40

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

    // MARK: - Internal Methods

    func setupInitialState() {
        selectionStyle = .none
        configureBackground()
    }

}

// MARK: - Private Methods

private extension MainScreenTableViewCell {
    
    func configureBackground() {
        backgroundColor = .black
    }
    
}
