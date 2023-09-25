//
//  DetailsViewController.swift
//  MoviesList
//
//  Created by Artyom Guzenko on 25.09.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var coverMovie: UIImageView = {
        let defaultImage = UIImage(named: "1")
        let imageView = UIImageView(image: defaultImage)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var fullInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarch()
        setupLayout()
        setupView()
    }
}

// MARK: - Configuration view

extension DetailsViewController {
    private func setupHierarch() {
        fullInfoStack.addArrangedSubview(coverMovie)
        fullInfoStack.addArrangedSubview(descriptionLabel)
        view.addSubview(fullInfoStack)
    }
    
    private func setupLayout() {
        fullInfoStack.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        fullInfoStack.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
    }
}
