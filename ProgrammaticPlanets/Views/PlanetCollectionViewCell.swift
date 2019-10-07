//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var planet: Planet! {
        didSet {
            updateViews()
        }
    }

	// You programmatically initializing this cell
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupSubviews()
	}

	// The storyboard or xib initializing the cell
	required init(coder: NSCoder) {
		super.init(coder: coder)!
		setupSubviews()
	}

	private func setupSubviews() {

		// Set up the imageView
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit

		addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
			imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
			imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
			])

		self.imageView = imageView


		// Setting up label
		let label = UILabel()
		label.textAlignment = .center

		addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: label,
							   attribute: .top,
							   relatedBy: .equal,
							   toItem: imageView,
							   attribute: .bottom,
							   multiplier: 1,
							   constant: 4),
			NSLayoutConstraint(item: label,
							   attribute: .leading,
							   relatedBy: .equal,
							   toItem: self,
							   attribute: .leading,
							   multiplier: 1,
							   constant: 2),
			NSLayoutConstraint(item: label,
							   attribute: .trailing,
							   relatedBy: .equal,
							   toItem: self,
							   attribute: .trailing,
							   multiplier: 1,
							   constant: -2)
			])
		self.nameLabel = label
	}


    
    private func updateViews() {
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
}
