import Ignite

struct NumbaseSupport: StaticLayout {
    let path = "numbase/support"
    let title = "Numbase Support"
    
    let qaPairs = [
        QuestionAnswerPair(
            question: "What number bases does Numbase support?",
            answer: "Numbase supports decimal (base 10), binary (base 2), hexadecimal (base 16), and octal (base 8) number systems."
        ),
        QuestionAnswerPair(
            question: "How do I use the floating window feature?",
            answer: "Click the \"Floating Window\" toggle in the top-right corner of any section. This will keep Numbase visible above other windows, making it easy to reference while working in other apps."
        ),
        QuestionAnswerPair(
            question: "What's the maximum number size Numbase can handle?",
            answer: "Numbase supports numbers up to 128 bits, making it suitable for most development needs."
        ),
        QuestionAnswerPair(
            question: "How do I copy results?",
            answer: "Each section has a copy button (📄) next to the result. Click it to copy the value to your clipboard."
        ),
        QuestionAnswerPair(
            question: "Can I use keyboard shortcuts?",
            answer: "While keyboard shortcuts are not yet supported, Numbase does support full keyboard navigation by using Tab to move between controls."
        ),
        QuestionAnswerPair(
            question: "What does \"Index from 1\" do in the binary view?",
            answer: "This option changes how bits are numbered. When enabled, bits are numbered starting from 1 instead of 0, which can be helpful depending on your preference or documentation requirements."
        ),
        QuestionAnswerPair(
            question: "Why do I see two decimal representations in binary mode?",
            answer: "The binary view shows both unsigned and signed decimal representations. The signed representation treats the leftmost bit as a sign bit, useful when working with signed integers."
        )
    ]
    
    var body: some HTML {
        Header(
            title: title,
            subtitle: "Numbase is a macOS utility for converting between number bases (decimal, binary, hexadecimal, and octal) and performing calculations in different bases.",
            subnote: "v1.0"
        )
        
        VStack {
            Text("System Requirements")
                .font(.title3)
            
            List {
                Section {
                    "macOS 15.0 (Sequoia)"
                        .fontWeight(.bold)
                    
                    "or later"
                }
                .style(.display, "flex")
                
                Text("Apple Silicon or Intel Mac")
            }
            
            Text("Features")
                .font(.title3)
            
            Text("- Core Features:")
                .font(.system(.title1, size: .rem(0.9), weight: .semibold))
                .padding(.top, .px(20))
                .padding(.bottom, .px(5))
            
            List {
                Group {
                    Text("Convert between number bases:")
                    
                    List {
                        Text("Decimal (base 10)")
                        
                        Text("Binary (base 2)")
                        
                        Text("Hexadecimal (base 16)")
                        
                        Text("Octal (base 8)")
                    }
                }
                
                Text("Real-time conversion with error validation")
                
                Text("One-click copying of results")
            }
            
            Text("- Mathematical Operations:")
                .font(.system(.title1, size: .rem(0.9), weight: .semibold))
                .padding(.top, .px(20))
                .padding(.bottom, .px(5))
            
            List {
                Text("Addition (+)")
                Text("Subtraction (-)")
                Text("Multiplication (×)")
                Text("Division (÷)")
                Text("Modulo (%)")
                Text("Logical AND (&)")
                Text("Logical OR (|)")
                Text("Logical XOR (^)")
                Text("Calculations in any supported base")
            }
            
            Text("- Binary Manipulation:")
                .font(.system(.title1, size: .rem(0.9), weight: .semibold))
                .padding(.top, .px(20))
                .padding(.bottom, .px(5))
            
            List {
                Text("Visual bit toggling")
                Text("Left/right bit shifting")
                Text("Set/Clear all bits")
                Text("Flip all bits")
                Text("Increase/decrease bit count")
                Text("View representations in all bases simultaneously")
                Text("View signed and unsigned decimal values")
            }
            
            Text("- Usability Features:")
                .font(.system(.title1, size: .rem(0.9), weight: .semibold))
                .padding(.top, .px(20))
                .padding(.bottom, .px(5))
            
            List {
                Text("Floating window option (stays on top)")
                Text("Keyboard navigation")
                Text("VoiceOver accessibility")
                Text("Command shortcuts")
                Text("Error feedback for invalid inputs")
                Text("Copy results to clipboard")
                Text("Index from 0 or 1 option for binary view")
            }
            
            Text("Keyboard Shortcuts")
                .font(.title3)
            
            List {
                Text("No keyboard shortcuts currently exist yet, though they are planned.")
            }
            
            Text("Common Questions")
                .font(.title3)
            
            ForEach(qaPairs) { qa in
                Text("Q: " + qa.question)
                    .font(.system(.title1, size: .rem(1), weight: .semibold))
                
                Text("A: " + qa.answer)
                    .padding(.bottom, .px(10))
            }
            
            
            Text("Q: How do I report a bug or suggest a feature?")
                .font(.system(.title1, size: .rem(1), weight: .semibold))
            Text {
                "A: You can contact me at "
                
                Link("jordan.c4922@gmail.com", target: "mailto:jordan.c4922@gmail.com")
                
                " with any issues or suggestions."
            }
            
            Text("Getting Help")
                .font(.title3)
            
            Text("Having issues with Numbase? You can:")
                .font(.system(.title1, size: .rem(0.9), weight: .semibold))
                .padding(.top, .px(20))
                .padding(.bottom, .px(5))
            
            List {
                Text {
                    "Email support: "
                    
                    Link("jordan.c4922@gmail.com", target: "mailto:jordan.c4922@gmail.com")
                }
                
                Text("Report issues: Use the email above, include the word 'bug' in the subject and provide the app version and how to reproduce the issue in the email body.")
                
                Text("Submit feedback: Use the email above, include the word 'feedback' in the subject and explain the feature/improvement you would like to see in the email body.")
            }
            
            Text("Version History")
                .font(.title3)
            
            Text("Current Version: 1.0")
            
            List {
                Text("Initial release")
            }
            
        }
        .margin(40)
    }
}
