//
//  CountViewModel.swift
//  TCount
//
//  Created by L.T.A Neeft on 20/04/2021.
//

import SwiftUI

class CountViewModel: ObservableObject {
    @Published private var sections: SectionModel = CountViewModel.createSection(section: sectionArray)
    
    static private var sectionArray = [0,0,0,0]
    
   
    static func createSection(section: Array<Int>) -> SectionModel {
        return SectionModel(totalAmountOfSections: section.count) { i in
            return section[i]
        }
    }
    
    //MARK: - Intents:
    
    var totals: Int { 
        var totals = 0
        for index in sections.sections.indices {
            totals = totals + sections.sections[index].section
        }
        return totals
    }
    
    func chooseSection(section: SectionModel.Section) {
        sections.chooseSection(section: section)
    }
    
    func incrementPoints(section: SectionModel.Section) {
        sections.increaseSection(section: section)
    }
    
    func decreasePoints(section: SectionModel.Section) {
        sections.decreaseSection(section: section)
    }
    
    //MARK: - Access to the Model:
    
    var section: Array<SectionModel.Section> {
        sections.sections
    }

}
