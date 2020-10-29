//
//  FWFormController.swift
//  
//
//  Created by Artur Carneiro on 29/09/20.
//

import UIKit

public protocol FWFormDelegate: AnyObject {
    func result(_ data: Data)
}

/// Representation of a form. It displays each component as a cell of a `UICollectionView`.
public final class FWFormViewController: UIViewController {
    // MARK: Properties
    @ManualLayout private var formCollectionView: FWFormCollectionView
    
    private let viewModel: FWFormViewModel

    public weak var delegate: FWFormDelegate?
	
    // MARK: Init
    /// Initializes a new instance of this type.
    public init(for json: Data) {
		self.viewModel = FWFormViewModel(json)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        super.loadView()
        view.backgroundColor = .fwBackground
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
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
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfComponents {
            viewModel.submit()
        }
    }
    
}
// MARK: UICollectionViewDataSource
extension FWFormViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfComponents + 1
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == viewModel.numberOfComponents {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FWFormSubmitCollectionCell.identifier,
                                                                for: indexPath) as? FWFormSubmitCollectionCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FWSingleLineComponentView.identifier,
                                                                for: indexPath) as? FWSingleLineComponentView else {
                return UICollectionViewCell()
            }
            cell.configure(with: viewModel.viewModelAt(index: indexPath))

            return cell
        }
    }
}

// MARK: ViewModel Delegate
extension FWFormViewController: FWFormViewModelDelegate {
    func didSubmit(_ result: Result<Data, Error>) {
        switch result {
        case .success(let data):
            delegate?.result(data)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }

    func didReceiveComponents() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.formCollectionView.reloadData()
        }
    }
}
