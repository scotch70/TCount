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
    
    let total = sectionArray.reduce(0,+)
    
    static func createSection(section: Array<Int>) -> SectionModel {
        return SectionModel(totalAmountOfSections: section.count) { i in
            return section[i]
        }
    }
    
    //MARK: - Intents:
    
    
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
    
    
//    var isPressed: Color {
//        for sec in sections {
//            if sec.selected == true {
//                return .green
//            }
//        }
//        return .black
//    }
//
//    func selectedButton(id: Int) -> Bool {
//        if let row = self.sections.firstIndex(where: {$0.id == id}) {
//            return sections[row].selected == true
//        }
//        return false
//    }
//
//
//
//    func decrementPoints(id: Int) {
//        if let row = self.sections.firstIndex(where: {$0.id == id}) {
//            sections[row].section -= 1
//        }
//    }
//
//    func total() -> Int {
//        let total = sections[0].section + sections[1].section + sections[2].section + sections[3].section
//        return total
//    }
//
//    func minusButton() {
//        switch (sectionA.isSelected, sectionB.isSelected, sectionC.isSelected, sectionD.isSelected) {
//        case (true,false,false,false):
//            if sectionA.sectionInt > -1 && sectionA.sectionInt < 45 {
//                sectionA.sectionInt += 1
//            }
//        case (false,true,false,false):
//            if sectionB.sectionInt > -1 && sectionB.sectionInt < 48 {
//                sectionB.sectionInt += 1
//            }
//        case (false,false,true,false):
//            if sectionC.sectionInt > -1 && sectionC.sectionInt < 48 {
//                sectionC.sectionInt += 1
//            }
//        case (false,false,false,true):
//            if sectionD.sectionInt > -1 && sectionD.sectionInt < 48 {
//                sectionD.sectionInt += 1
//            }
//        default:
//            break
//        }
//    }
    
//    func plusButton() {
//        switch (sectionA.isSelected, sectionB.isSelected, sectionC.isSelected, sectionD.isSelected) {
//        case (true,false,false,false):
//            if sectionA.sectionInt > 0 && sectionA.sectionInt < 46 {
//                sectionA.sectionInt -= 1
//            }
//        case (false,true,false,false):
//            if sectionB.sectionInt > 0 && sectionB.sectionInt < 49 {
//                sectionB.sectionInt -= 1
//            }
//        case (false,false,true,false):
//            if sectionC.sectionInt > 0 && sectionC.sectionInt < 49 {
//                sectionC.sectionInt -= 1
//            }
//        case (false,false,false,true):
//            if sectionD.sectionInt > 0 && sectionD.sectionInt < 49 {
//                sectionD.sectionInt -= 1
//            }
//        default:
//            break
//        }
//    }
    
    
    
    
    
    

}
