//
//  TestFixtures.swift
//  
//
//  Created by Rafael Galdino on 08/10/20.
//

import Foundation
@testable import Formworks

enum TestFixtures {
    static let badFormData = Data("""
    {
        "title":"FormTitle"
    }
    """.utf8)

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
                "title":"Single Select",
                "subtitle":"Subtitle",
                "errorMessage":"errorMessage",
                "componentType":"single_select",
                "required":false,
                "specs":{
                            "options":["Option1", "Option2", "Option3"]
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

    static let singleSelectComponentData = Data("""
    {
        "title":"Single Select",
        "subtitle":"Subtitle",
        "errorMessage":"errorMessage",
        "componentType":"single_select",
        "required":false,
        "specs":{
                    "options":["Option1", "Option2", "Option3"]
                }
    }
    """.utf8)
}

extension TestFixtures {
    static let minimalForm = FWFormData(title: "", components: [])
    static let form = FWFormData(title: "FormTitle", components: [plainTextComponent, singleSelectComponent])
    static let plainTextComponent = FWComponentData(title: "Plain Text",
                                                    subtitle: "Subtitle", errorMessage: "errorMessage",
                                                    required: true,
                                                    specs: FWPlainTextSpecs(placeholder: "Placeholder"))
    static let singleSelectComponent = FWComponentData(title: "Single Select",
                                                       subtitle: "Subtitle",
                                                       errorMessage: "errorMessage",
                                                       required: false,
                                                       specs: FWSingleSelectSpecs(options: ["Option1", "Option2", "Option3"]))
}
