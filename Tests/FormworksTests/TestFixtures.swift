//
//  TestFixtures.swift
//  
//
//  Created by Rafael Galdino on 08/10/20.
//

import Foundation
@testable import Formworks

enum TestFixtures {
    static let emptyFormData = Data("""
    {
        "title":"",
        "components": []
    }
    """.utf8)

    static let formData = Data("""
    {
        "title":"FormTitle",
        "components": [
            {
                "title":"Plain Text",
                "subtitle":"Subtitle",
                "errorMessage":"errorMessage",
                "componentType":"plain_text",
                "required":true,
                "specs":{
                            "placeholder":"Placeholder"
                        }
            },
            {
                "title":"Plain Text",
                "subtitle":"Subtitle",
                "errorMessage":"errorMessage",
                "componentType":"plain_text",
                "required":true,
                "specs":{
                            "placeholder":"Placeholder"
                        }
            }
        ]
    }
    """.utf8)

    static let badComponentData = Data("""
    {
        "title":"Title",
        "subtitle":"Subtitle",
        "errorMessage":"errorMessage",
        "componentType":"plain_text"
    }
    """.utf8)

    static let plainTextComponentData = Data("""
    {
        "title":"Plain Text",
        "subtitle":"Subtitle",
        "errorMessage":"errorMessage",
        "componentType":"plain_text",
        "required":true,
        "specs":{
                    "placeholder":"Placeholder"
                }
    }
    """.utf8)
}

extension TestFixtures {
    static let minimalForm = FWFormData(title: "", components: [])
    static let form = FWFormData(title: "FormTitle", components: [plainTextComponent, plainTextComponent])
    static let plainTextComponent = FWTextDataModel(title: "Text Component")
}
