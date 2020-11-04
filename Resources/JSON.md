# JSON Structure
## Example 
``` 
    {
        "title": "Formworks Title",
        "components": [
            "text": {
                "title": "What is your name?",
                "description": "Type your name.",
                "required": true,
                "validator": "max32",
                "placeholder": "Your name",
                "isMultiline": false
            },
            "text": {
                "title": "What is your e-mail?",
                "description": "Type your e-mail.",
                "required": true,
                "validator": "email",
                "placeholder": "example@domain.com",
                "isMultiline": false
            },
             "text": {
                "title": "Tell us a little bit about yourself",
                "description": "We want to know more about you.",
                "validator": "max256",
                "isMultiline": true
            },
            "select": {
               "title": "Pick a color",
                "required": true,
                "validator": "single",
                "options": [
                    "Red",
                    "Blue", 
                    "Green"
                ]
            }
        ]
    }
```
## Fields
### Required
- Form: 
    - Title: título do formulário
    - Components: vetor de componentes
        - Text: é o componente de texto do formulário.
            - Title: 
        - Select: é o componente de seleção do formulário.

