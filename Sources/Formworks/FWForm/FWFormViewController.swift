//
//  FWFormController.swift
//  
//
//  Created by Artur Carneiro on 29/09/20.
//

import UIKit

public final class FWFormViewController: UIViewController {
    // MARK: Properties
    @ManualLayout private var formCollectionView: FWFormCollectionView
	private var components: [[FWSingleLineComponent]] = [[FWSingleLineComponent]]()
	private let viewModel: FWFormViewModel
	
    // MARK: Init
    /// Initializes a new instance of this type.
    public init() {
		self.viewModel = FWFormViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        super.loadView()
        view.backgroundColor = .fwFormBackground
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpCollectionViewConstraints()
		setUpViewModel()
    }
	
	// MARK: ViewModel setup
	private func setUpViewModel() {
		viewModel.delegate = self
		viewModel.build()
	}
	
	
    private func setUpCollectionView() {
        formCollectionView.delegate = self
        formCollectionView.dataSource = self
    }
    
    /// This function will create the necessary constraints for the CollectionView
    /// to occupy the entire ViewController.
    private func setUpCollectionViewConstraints() {
        view.addSubview(formCollectionView)
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            formCollectionView.topAnchor.constraint(equalTo: guides.topAnchor),
            formCollectionView.leftAnchor.constraint(equalTo: guides.leftAnchor),
            formCollectionView.bottomAnchor.constraint(equalTo: guides.bottomAnchor),
            formCollectionView.rightAnchor.constraint(equalTo: guides.rightAnchor)
        ])
    }
}
// MARK: UICollectionViewDelegate
extension FWFormViewController: UICollectionViewDelegate {
    
}
// MARK: UICollectionViewDataSource
extension FWFormViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfComponents
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FWFormCollectionCell.identifier, for: indexPath) as? FWFormCollectionCell else {
			return UICollectionViewCell()
		}
		cell.configure(components[indexPath.section][indexPath.item].view)
		
		return cell
    }
}

// MARK: ViewModel Delegate
extension FWFormViewController: FWFormViewModelDelegate {
	func didReceiveComponents(_ components: [[FWSingleLineComponent]]) {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }
			self.components = components
			self.formCollectionView.reloadData()
		}
	}
}
