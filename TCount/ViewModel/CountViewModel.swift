//
//  CountViewModel.swift
//  TCount
//
//  Created by L.T.A Neeft on 20/04/2021.
//

import SwiftUI

class CountViewModel: ObservableObject {
    
    @Published var sections = [
        SectionModel(id: 1, section: 0, selected: false),
        SectionModel(id: 2, section: 0, selected: false),
        SectionModel(id: 3, section: 0, selected: false),
        SectionModel(id: 4, section: 0, selected: false)
    ]
    
    
    
    
    
    //MARK: - Intents:
    
    func incrementPoints(id: Int) {
        if let row = self.sections.firstIndex(where: {$0.id == id}) {
            sections[row].section += 1
        }
    }
    
    func decrementPoints(id: Int) {
        if let row = self.sections.firstIndex(where: {$0.id == id}) {
            sections[row].section -= 1
        }
    }
    func selectionBool(id: Int) -> Color {
        if let row = self.sections.firstIndex(where: {$0.id == id}) {
            sections[row].selected = true
            decrementPoints(id: id)
            incrementPoints(id: id)
            return Color.green
        }
        return Color.black
        
    }
    
    func total() -> Int {
        let total = sections[0].section + sections[1].section + sections[2].section + sections[3].section
        return total
    }
    
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
    
    
    
    //MARK: - Access to the Model:
    
    

}
