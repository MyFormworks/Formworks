//
//  TestFixtures.swift
//  
//
//  Created by Rafael Galdino on 08/10/20.
//

import Foundation
import UIKit
@testable import Formworks

enum TestFixtures {
    static let emptyFormData = Data("""
    {
        "id": "",
        "responseFormat": "",
        "title": "",
        "style": {},
        "components": []
    }
    """.utf8)

    static let formData = Data("""
    {
        "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
        "responseFormat": "long",
        "title": "FormTitle",
        "style": {
            "accent": "#F0F0F0FF",
            "background": "#CACACAFF",
            "componentBackground": "#F0F0F0FF",
            "componentTitle": "#212121FF",
            "componentDescription": "#212121FF",
            "componentInputText": "#212121FF",
            "componentInputBackground": "#FDFDFDFF",
            "componentRequired": "#FD5C5CFF",
            "componentCorrect": "#78C256FF"
        },
        "components": [
            {
                "text": {
                    "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                    "title": "What is your name?",
                    "description": "Type your name.",
                    "required": true,
                    "placeholder": "Your name"
                }
            },
            {
                "text": {
                    "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                    "title": "What is your name?",
                    "description": "Type your name.",
                    "required": true,
                    "placeholder": "Your name"
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
            "placeholder": "Your name"
        }
    }
    """.utf8)
    
}

extension TestFixtures {
    static let styleSpec = FWStyleSpecification(accent: UIColor(hex: "#F0F0F0FF")!,
                                                background: UIColor(hex: "#CACACAFF")!,
                                                componentBackground: UIColor(hex:"#F0F0F0FF")!,
                                                componentTitle: UIColor(hex:"#212121FF")!,
                                                componentDescription: UIColor(hex: "#212121FF")!,
                                                componentInputText: UIColor(hex:"#212121FF")!,
                                                componentInputBackground: UIColor(hex: "#FDFDFDFF")!,
                                                componentRequired: UIColor(hex: "#FD5C5CFF")!,
                                                componentCorrect: UIColor(hex: "#78C256FF")!)
    static let minimalForm = FWFormModel(id: "87986E91-247F-4F36-A577-19DF6BD165D0", title: "", responseFormat: .long, components: [], style: styleSpec)
    static let form = FWFormModel(id: "87986E91-247F-4F36-A577-19DF6BD165D0", title: "FormTitle", responseFormat: .long, components: [textComponent, textComponent], style: styleSpec)
    static let textComponent = FWTextModel(id: "87986E91-247F-4F36-A577-19DF6BD165D0", title: "What is your name?", description: "Type your name.", required: true, placeholder: "Your name")
}
