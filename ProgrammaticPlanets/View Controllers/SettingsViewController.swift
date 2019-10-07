//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
     var shouldShowPlutoSwitch: UISwitch!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
		setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // MARK: - Action Handlers
    
	@objc func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }

	// This just says that this is an objective-C function
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private

	private func setupSubviews() {

		// .system makes the button look like a system element
		let doneButton = UIButton(type: .system)
		doneButton.setTitle("Done", for: .normal)
		doneButton.addTarget(self, action: #selector(done), for: .touchUpInside) // #selector is obj-C code

		// Add as subview and turn off autosizing mask
		view.addSubview(doneButton)
		doneButton.translatesAutoresizingMaskIntoConstraints = false

		// Constrain the button, buttons have an intrinsic size, so we don't need to give it a height and width
		let doneTopConstraint =  NSLayoutConstraint(item: doneButton,
						   attribute: .top,
						   relatedBy: .equal,
						   toItem: view.safeAreaLayoutGuide,
						   attribute: .top,
						   multiplier: 1,
						   constant: 16)

		let doneTrailingConstraint = NSLayoutConstraint(item: doneButton,
														attribute: .trailing,
														relatedBy: .equal,
														toItem: view.safeAreaLayoutGuide,
														attribute: .trailing,
														multiplier: 1,
														constant: -8)

		NSLayoutConstraint.activate([doneTopConstraint, doneTrailingConstraint])

		//Pluto switch
		let plutoSwitch = UISwitch()
		plutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto), for: .valueChanged)

		view.addSubview(plutoSwitch)
		plutoSwitch.translatesAutoresizingMaskIntoConstraints = false

		plutoSwitch.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 40).isActive = true
		plutoSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true

		// Set the view controller's switch property to the switch we just set up
		// This allows us to access the switch outside this function
		self.shouldShowPlutoSwitch = plutoSwitch

		let label = UILabel()
		label.text = "Is Pluto a planet?"

		view.addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false

		label.centerYAnchor.constraint(equalTo: plutoSwitch.centerYAnchor).isActive = true
		label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
		label.trailingAnchor.constraint(equalTo: plutoSwitch.leadingAnchor, constant: -8).isActive = true

	}
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}

