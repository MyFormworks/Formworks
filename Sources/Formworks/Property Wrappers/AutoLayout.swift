//
//  File.swift
//  
//
//  Created by Artur Carneiro on 28/09/20.
//

import UIKit

/// Property wrapper used to make it easier to instantiate a `UIView` or
/// its subclasses. **You should only use this property wrapper if you only
/// need the object to be initialized with the following init:** `init(frame: .zero)`.
@propertyWrapper final class AutoLayout<View: UIView> {
    /// A lazily instantiated `UIView` or `UIView` subclass with the
    /// `translatesAutoresizingMaskIntoConstraints` property set
    /// as `false`.
    private lazy var view: View = {
        let view = View(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// The read-only wrapped `UIView` or `UIView` subclass.
    var wrappedValue: View {
        return view
    }
}
