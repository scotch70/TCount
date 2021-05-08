//
//  SectionModel.swift
//  TCount
//
//  Created by L.T.A Neeft on 20/04/2021.
//

import Foundation

struct SectionModel {
    var sections: Array<Section>
    
    var indexOfTheSelectedSection: Int?
    
    mutating func chooseSection(section: Section) {
        if let chosenIndex: Int = sections.firstIndext(matching: section) {
            for index in sections.indices {
                sections[index].selected = false
            }
            self.sections[chosenIndex].selected = true
        }
        
    }
    
    mutating func increaseSection(section: Section) {
        if let chosenIndex: Int = sections.firstIndext(matching: section) {
            if self.sections[chosenIndex].selected == true {
                if sections[chosenIndex].section > -1  &&  sections[chosenIndex].section < 48 {
                    self.sections[chosenIndex].section += 1
                }
            }
        }
    }
    
    mutating func decreaseSection(section: Section) {
        if let chosenIndex: Int = sections.firstIndext(matching: section) {
            if self.sections[chosenIndex].selected == true {
                if sections[chosenIndex].section > 0  &&  sections[chosenIndex].section < 49 {
                    self.sections[chosenIndex].section -= 1
                }
            }
        }
    }
    

    init(totalAmountOfSections: Int, sectionContent: (Int) -> Int) {
        sections = Array<Section>()
        for idIndex in 0..<totalAmountOfSections {
            let content = sectionContent(idIndex)
            sections.append(Section(id: idIndex + 1, section: content))
        }
    }
    
    struct Section: Identifiable {
        var id: Int
        var section: Int
        var selected: Bool = false
    }

}
