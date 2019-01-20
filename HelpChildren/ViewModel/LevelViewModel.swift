//
//  LevelViewModel.swift
//  HelpChildren
//
//  Created by João Gabriel on 17/01/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

class LevelViewModel {
    private let shapes = ["square", "circle", "triangle", "rectangle", "star"]
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
    
//    func filterBy(_ level: LevelNumber = .training) -> [Activity] {
//        return self.training.filter { $0.level == level.rawValue }
//    }
    
    func generate(level: LevelNumber = .training) -> [Activity] {
        switch level {
        case .one: return createLevel1()
        case .two: return createLevel2()
        case .three: return createLevel3()
        case .four: return createLevel4()
        case .five: return createLevel5()
        case .six: return createLevel6()
        case .seven: return createLevel7()
        case .eight: return createLevel8()
        case .nine: return createLevel9()
        default: return getTrainingLevel()
        }
    }
    
    private func getTrainingLevel() -> [Activity] {
        return self.training
    }
    
    //todas as formas de uma atividade sao iguais
    private func createBaseShapesArrayFor(level: LevelNumber) -> [Activity] {
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
    
    private func createLevel1() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .one)
        
        //A-B -> C
        for i in 0...9 {
            let a = activities[i]
            let s = environementSounds[i]
            a.audio1 = s
            a.audio2 = s
            a.audio3 = "nan"
        }
        
        //A-C -> B
        for i in 10...19 {
            let a = activities[i]
            let s = environementSounds[i - 10]
            a.audio1 = s
            a.audio2 = "nan"
            a.audio3 = s
        }
        
        return activities.shuffled().shuffled().shuffled()
        /*
         
         A-B Chuva - C
         A-B Bebê - C
         A-B Porco - C
         A-B Porta - C
         A-B Cachorro - C
         A-C Chuva - B
         A-C Bebê - B
         A-C Porco - B
         A-C Porta - B
         A-C Cachorro - B
         eu editei pra cima
         original pra baixo
         A-B Chuva
         A-B Chuva
         A-C Chuva
         A-B Chuva
         A-C Bebê
         A-B Bebê
         A-B Bebê
         A-C Bebê
         A-B Porco
         A-C Porco
         A-B Porco
         A-B Porco
         A-C Porta
         A-C Porta
         A-B Porta
         A-C Porta
         A-B Cachorro
         A-C Cachorro
         A-C Cachorro
         A-C Cachorro
         
         */
    }
    
    //TODO: adicionar o som neutro com o nome de neutral
    private func createLevel2() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .two)
        
        //A-B -> C
        for i in 0...9 {
            let a = activities[i]
            let s = environementSounds[i]
            a.audio1 = s
            a.audio2 = s
            a.audio3 = "neutral"
        }
        
        //A-C -> B
        for i in 10...19 {
            let a = activities[i]
            let s = environementSounds[i - 10]
            a.audio1 = s
            a.audio2 = "neutral"
            a.audio3 = s
        }
        
        return activities.shuffled().shuffled().shuffled()
    }
    
    private func createLevel3() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .three)
        
        //A-B -> C
        for i in 0...9 {
            let a = activities[i]
            let s = environementSounds[i]
            a.audio1 = s
            a.audio2 = s
            a.audio3 = environementSounds.getRandom(except: s)
        }
        
        //A-C -> B
        for i in 10...19 {
            let a = activities[i]
            let s = environementSounds[i - 10]
            a.audio1 = s
            a.audio2 = environementSounds.getRandom(except: s)
            a.audio3 = s
        }
        
        return activities.shuffled().shuffled().shuffled()
    }
    
    //daqui pra frente é tudo igual
    //só muda os sons que serao tocados
    private func createLevel4() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .four)
        let sounds = ["Pao", "Boi", "Cais", "Mar", "Gol", "Pao", "Boi", "Cais", "Mar", "Gol"]
        
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
    
    private func createLevel5() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .five)
        let sounds = ["Pe", "Pau", "Gol", "Gas", "Seu", "Sol", "Vai", "Voo", "Mel", "Meu"]
        
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
    
    private func createLevel6() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .six)
        let sounds = ["Mão", "Tão", "Flor", "Cor", "Oi", "Boi", "Sou", "Gol", "Mês", "Fez"]

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
    
    private func createLevel7() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .seven)
        let sounds = ["Bota", "Beija", "Manhã", "Meia", "Achei", "Abrir", "Preto", "Pata", "Quintal", "Quarto"]
        
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
    
    private func createLevel8() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .eight)
        let sounds = ["Fato", "Gato", "Pega", "Nega", "Festa", "Testa", "Bola", "Cola", "Laços", "Braços"]
        
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
    
    private func createLevel9() -> [Activity] {
        let activities = createBaseShapesArrayFor(level: .five)
        let sounds = ["Lavar", "Largar", "Bruços", "Braços", "Faço", "Faça", "Secar", "Serrar", "Rabo", "Raso"]        
        
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
}

//extension Array where Generator.Element: String {
extension Sequence where Iterator.Element == String {
    func getRandom(except: String) -> String {
        return self.filter { $0 != except }.randomElement()!
    }
}
