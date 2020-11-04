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
        "id": "",
        "responseType": "",
        "title": "",
        "components": []
    }
    """.utf8)

    static let formData = Data("""
    {
        "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
        "responseType": "long",
        "title": "FormTitle",
        "components": [
            {
                "text": {
                    "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                    "title": "What is your name?",
                    "description": "Type your name.",
                    "required": true,
                    "validator": "max32",
                    "placeholder": "Your name",
                    "isMultiline": false
                }
            },
            {
                "text": {
                    "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                    "title": "What is your name?",
                    "description": "Type your name.",
                    "required": true,
                    "validator": "max32",
                    "placeholder": "Your name",
                    "isMultiline": false
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

    static let textComponentData = Data("""
    {
        "text": {
            "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
            "title": "What is your name?",
            "description": "Type your name.",
            "required": true,
            "validator": "max32",
            "placeholder": "Your name",
            "isMultiline": false
        }
    }
    """.utf8)
}

extension TestFixtures {
    static let minimalForm = FWFormModel(id: "87986E91-247F-4F36-A577-19DF6BD165D0", title: "", responseFormat: .long, components: [])
    static let form = FWFormModel(id: "87986E91-247F-4F36-A577-19DF6BD165D0", title: "FormTitle", responseFormat: .long, components: [textComponent, textComponent])
    static let textComponent = FWTextModel(id: "87986E91-247F-4F36-A577-19DF6BD165D0", title: "What is your name?", description: "Type your name.", required: true, validator: "max32", placeholder: "Your name", isMultiline: false)
}
