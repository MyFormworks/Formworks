//
//  FWFormController.swift
//
//
//  Created by Artur Carneiro on 29/09/20.
//
import UIKit

// MARK: Protocol-Delegate
/// Responsible for providing a communication path for the
/// `FWFormViewController`to notify relevant state changes in the form.
public protocol FWFormViewControllerDelegate: AnyObject {
	func didSubmit(_ answers: FWFormSnapshot)
}

/// Representation of a form. It displays each component as a cell of a `UITableView`.
public final class FWFormViewController: UIViewController {
	// MARK: Properties
	@ManualLayout private var formTableView: UITableView
	
	private let viewModel: FWFormViewModel
	
	weak var delegate: FWFormViewControllerDelegate?
	
	// MARK: Init
	/// Initializes a new instance of this type.
	/// - Parameter configuration: The configuration used to create a form.
	public init(configuration: FWConfiguration) {
		self.viewModel = FWFormViewModel(configuration: configuration)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Life cycle
	public override func loadView() {
		super.loadView()
		view.backgroundColor = .fwBackground
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		setUpViewModel()
		setUpTableView()
		layoutTableViewConstraints()
	}
	
	// MARK: ViewModel setup
	/// Sets up the  `FWFormViewModel`.
	private func setUpViewModel() {
		viewModel.delegate = self
	}
	
	// MARK: TableView setup
	/// Sets up the `formViewTable`.
	private func setUpTableView() {
		formTableView.delegate = self
		formTableView.dataSource = self
		formTableView.register(FWTextComponentView.self,
							   forCellReuseIdentifier: FWTextComponentView.identifier)
		formTableView.register(FWFormSubmitTableCell.self, forCellReuseIdentifier: FWFormSubmitTableCell.identifier)
		formTableView.register(FWHeader.self, forHeaderFooterViewReuseIdentifier: FWHeader.id)
		formTableView.register(FWDismissHeader.self, forHeaderFooterViewReuseIdentifier: FWDismissHeader.id)
		formTableView.backgroundColor = UIColor.fwBackground
		formTableView.rowHeight = UITableView.automaticDimension
		formTableView.estimatedRowHeight = 100
		formTableView.separatorStyle = .none
	}
	
	// MARK: Layout
	/// Layouts constraints for the `formTableView`.
	private func layoutTableViewConstraints() {
		view.addSubview(formTableView)
		let guides = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			formTableView.topAnchor.constraint(equalTo: guides.topAnchor),
			formTableView.leftAnchor.constraint(equalTo: guides.leftAnchor),
			formTableView.bottomAnchor.constraint(equalTo: guides.bottomAnchor),
			formTableView.rightAnchor.constraint(equalTo: guides.rightAnchor)
		])
	}
	
	@objc private func didCancel( ) {
		self.dismiss(animated: true, completion: nil)
	}
}
// MARK: UITableViewDelegate
extension FWFormViewController: UITableViewDelegate {
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == viewModel.numberOfComponents {
			let didSubmit = viewModel.submit()
			switch didSubmit {
				case .success(let snapshot):
					delegate?.didSubmit(snapshot)
				case .failure(_):
					break
				// TODO: Error Handling
			}
		}
	}
	
	public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if ((navigationController?.isBeingPresented) == nil) {
			guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FWDismissHeader.id) as? FWDismissHeader else {
				return UITableViewHeaderFooterView()
			}
			header.setHeaderTitle(text: viewModel.title)
			header.button.addTarget(self, action: #selector(didCancel), for: .allEvents)
			return header
		} else {
			guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FWHeader.id) as? FWHeader else {
				return UITableViewHeaderFooterView()
			}
			header.setHeaderTitle(text: viewModel.title)
			return header
		}
	}
	
	public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 50
	}
}

// MARK: UITableViewDataSource
extension FWFormViewController: UITableViewDataSource {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfComponents + 1
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == viewModel.numberOfComponents{
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

// MARK: ViewModel Delegate
extension FWFormViewController: FWFormViewModelDelegate {
	func didSetUp() {
		UIColor.style = viewModel.style
		self.title = viewModel.title
		formTableView.reloadData()
	}
}
