//
//  FWFormViewModel.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation

/// A representation of the `FWForm`'s `ViewModel`.
final class FWFormViewModel {
    private let viewModels: [FWComponentViewModel]

    private let generator: FormGenerator

    init(viewModels: [FWComponentViewModel],
         title: String = "",
         generator: FormGenerator) {
        self.viewModels = viewModels
        self.title = title
        self.generator = generator
    }

    let title: String

    var numberOfComponents: Int {
        return viewModels.count
    }

    func viewModelAt(index: IndexPath) -> FWComponentViewModel {
        return viewModels[index.row]
    }

    func submit() -> Bool {
        var formSnapshot = FWFormSnapshot(title: self.title, components: [])

        for viewModel in viewModels {
            if viewModel.isValid {
                formSnapshot.components.append(viewModel.takeSnapshot())
            } else {
                return false
            }
        }

        generator.receive(formSnapshot)
        return true
    }
}
