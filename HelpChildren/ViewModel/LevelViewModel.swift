//
//  LevelViewModel.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

typealias Pair = (String, String)

class LevelViewModel {
    private let environementSounds = ["baby", "dog", "pig", "door", "rain", "baby", "dog", "pig", "door", "rain"]
    
    private var training: [Activity] = [Activity]()
    var updateLevelsList: (()->())?
    
    var menu: [Menu] = [Menu]() {
        didSet {
            self.updateLevelsList?()
        }
    }
    
    func loadMenu() {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!

        let jsonData = try! Data(contentsOf: url)
        let data = try! JSONDecoder().decode(Level.self, from: jsonData)
        
        training = data.training
        menu = data.menu
    }
    
    func generate(level: LevelNumber) -> [Activity] {
        switch level {
        case .training: return getTrainingLevel()
        case .one: return create(level, withSpecialSound: "")
        case .two: return create(level, withSpecialSound: "neutral")
        case .three: return create(level, with: environementSounds)
        default: return create(level)
        }
    }
    
    private func getTrainingLevel() -> [Activity] {
        return self.training
    }
    
    private func create(_ level: LevelNumber, withSpecialSound sound: String) -> [Activity] {
        let activities = createBaseShapesArrayFor(level: level)
        
        //A-B -> C
        for i in 0...9 {
            let a = activities[i]
            let s = environementSounds[i]
            a.audio1 = s
            a.audio2 = s
            a.audio3 = sound
        }
        
        //A-C -> B
        for i in 10...19 {
            let a = activities[i]
            let s = environementSounds[i - 10]
            a.audio1 = s
            a.audio2 = sound
            a.audio3 = s
        }
        
        return activities.shuffled().shuffled().shuffled()
    }
    
    private func create(_ level: LevelNumber) -> [Activity] {
        var sounds: [Pair] = []
        
        switch level {
        case .four:
            sounds = [("Pao", "Boi"), ("Cais", "Mar"), ("Gol", "Pao"), ("Boi", "Cais"), ("Mar", "Gol")]
        case .five:
            sounds = [("Pe", "Pau"), ("Gol", "Gas"), ("Seu", "Sol"), ("Vai", "Voo"), ("Mel", "Meu")]
        case .six:
            sounds = [("Mão", "Tão"), ("Flor", "Cor"), ("Oi", "Boi"), ("Sou", "Gol"), ("Mês", "Fez")]
        case .seven:
            sounds = [("Bota", "Beija"), ("Manhã", "Meia"), ("Achei", "Abrir"), ("Preto", "Pata"), ("Quintal", "Quarto")]
        case .eight:
            sounds = [("Fato", "Gato"), ("Pega", "Nega"), ("Festa", "Testa"), ("Bola", "Cola"), ("Laços", "Braços")]
        case .nine:
            sounds = [("Lavar", "Largar"), ("Bruços", "Braços"), ("Faço", "Faça"), ("Secar", "Serrar"), ("Rabo", "Raso")]
        default: return getTrainingLevel()
        }
        
        return create(level, with: sounds)
    }
    
    private func create(_ level: LevelNumber, with sounds: [String]) -> [Activity] {
        //Todos tem a mesma figura geométrica
        //10 B tem um som diferente de A e C
        //10 C tem um som diferente de A e B
        let activities = createBaseShapesArrayFor(level: level)
        
        //A-B -> C
        for i in 0...9 {
            let a = activities[i]
            let s = sounds[i]
            a.audio1 = s
            a.audio2 = s
            a.audio3 = sounds.getRandom(except: s)
        }
        
        //A-C -> B
        for i in 10...19 {
            let a = activities[i]
            let s = sounds[i - 10]
            a.audio1 = s
            a.audio2 = sounds.getRandom(except: s)
            a.audio3 = s
        }
        
        return activities.shuffled().shuffled().shuffled()
    }
    
    private func create(_ level: LevelNumber, with sounds: [Pair]) -> [Activity] {
        let activities = createBaseShapesArrayFor(level: level)
        
        var contador = 0
        
        sounds.forEach { (x, y) in
            for i in 0...3 {
                let a = activities[contador]
                a.audio1 = i % 2 == 0 ? x : y
                a.audio2 = (i == 0 || i == 1) ? x : y
                a.audio3 = (i == 0 || i == 1) ? y : x
                
                contador += 1
//                x y x y
//                x x y y
//                y y x x
//                a.audio1 = (i == 0 || i == 1) ? (i % 2 == 0 ? x : y) : (i % 2 == 0 ? x : y)
//                a.audio2 = (i == 0 || i == 1) ? (i % 2 == 0 ? x : x) : (i % 2 == 0 ? y : y)
//                a.audio3 = (i == 0 || i == 1) ? (i % 2 == 0 ? y : y) : (i % 2 == 0 ? x : x)
            }
        }
        
        return activities.shuffled().shuffled().shuffled()
    }
    
    private func createBaseShapesArrayFor(level: LevelNumber) -> [Activity] {
        //Todas as imagens de uma atividade são iguais
//        let shapes = ["square", "circle", "triangle", "rectangle", "star"]
        let shapes = ["squareS", "circleS", "triangleS", "rectangleS", "starS"]
        var activities = [Activity]()
        
        for j in 0..<5 {
            
            let shape = shapes[j]
            
            for _ in 0..<4 {
                
                let activity = Activity()
                activity.level = level.rawValue
                activity.order = 0
                activity.image1 = shape
                activity.image2 = shape
                activity.image3 = shape
                activity.audio1 = ""
                activity.audio2 = ""
                activity.audio3 = ""
                activities.append(activity)
            }
        }
        
        var order = 1
        activities = activities.shuffled().shuffled().map { (activity) in
            activity.order = order
            order += 1
            return activity
        }
        
        return activities.sorted { $0.order < $1.order }
    }
}

//extension Array where Generator.Element: String {
extension Sequence where Iterator.Element == String {
    func getRandom(except: String) -> String {
        return self.filter { $0 != except }.randomElement() ?? except
    }
}
