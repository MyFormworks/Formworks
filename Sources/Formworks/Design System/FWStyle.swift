import Foundation

/// The form's color style.
public enum FWStyle: Equatable {
	/// The default light color style of a form.
	case light
	
	/// The default dark color style of a form.
	case dark
	
	/// A custom color style of a form.
	case custom(FWStyleSpecification)
}

