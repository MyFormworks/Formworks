//
//  FWFormController.swift
//  
//
//  Created by Artur Carneiro on 29/09/20.
//

import UIKit

/// Representation of a form. It displays each component as a cell of a `UICollectionView`.
public final class FWFormViewController: UIViewController {
    // MARK: Properties
    @ManualLayout private var formTableView: UITableView
    
    private let viewModel: FWFormViewModel
	
    // MARK: Init
    /// Initializes a new instance of this type.
    init(viewModel: FWFormViewModel) {
        self.viewModel = viewModel
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
        setUpViewModel()
        setUpTableView()
        setUpTableViewConstraints()
    }
	
	// MARK: ViewModel setup
	private func setUpViewModel() {
		
	}
	
    private func setUpTableView() {
        formTableView.delegate = self
        formTableView.dataSource = self
        formTableView.register(FWTextComponentView.self,
                 forCellReuseIdentifier: FWTextComponentView.identifier)
        formTableView.backgroundColor = UIColor.fwBackground
        formTableView.rowHeight = UITableView.automaticDimension
        formTableView.estimatedRowHeight = 100
        formTableView.separatorStyle = .none
    }
    
    /// This function will create the necessary constraints for the CollectionView
    /// to occupy the entire ViewController.
    private func setUpTableViewConstraints() {
        view.addSubview(formTableView)
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            formTableView.topAnchor.constraint(equalTo: guides.topAnchor),
            formTableView.leftAnchor.constraint(equalTo: guides.leftAnchor),
            formTableView.bottomAnchor.constraint(equalTo: guides.bottomAnchor),
            formTableView.rightAnchor.constraint(equalTo: guides.rightAnchor)
        ])
    }
}
// MARK: UITableViewDelegate
extension FWFormViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfComponents {
            if viewModel.submit() {

            } else {
                
            }
        }
    }
}

// MARK: UITableViewDataSource
extension FWFormViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfComponents + 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == viewModel.numberOfComponents + 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FWFormSubmitTableCell.identifier) as? FWFormSubmitTableCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FWTextComponentView.identifier) as? FWTextComponentView else {
                return UITableViewCell()
            }
            cell.configure(with: viewModel.viewModelAt(index: indexPath))
            return cell
        }
    }


}
