//
//  AudioMedia.swift
//  HelpChildren
//
//  Created by João Gabriel de Britto e Silva on 27/03/19.
//  Copyright © 2019 João Gabriel de Britto e Silva. All rights reserved.
//

import Foundation

enum AudioMedia: String {
    /// Training
    case dog = "dog"
    case rain = "rain"
    case door = "door"
    case baby = "baby"
    
    /// Advanced
    case open = "abrir"
    case found = "achei"
    case kiss = "beija"
    case cow = "boi"
    case ball = "bola"
    case arms = "bracos"
    case pier = "cais_perguntar"
    case glue = "cola"
    case color = "cor_perguntar"
    case youDo = "faca"
    case iDo = "faco"
    case fact = "fato"
    case party = "festa"
    case did = "fez"
    case flower = "flor"
    case gas = "gas"
    case cat = "gato"
    case goal = "gol"
    case lace = "lacos"
    case drop = "largar"
    case wash = "lavar"
    case morning = "manha"
    case hand = "mao"
    case sea = "mar"
    case but = "mas_perguntar"
    case sock = "meia"
    case honey = "mel"
    case month = "mes"
    case mine = "meu"
    case deny = "nega"
    case neutral = "neutro"
    case hi = "oi"
    case bread = "pao"
    case pawn = "pata"
    case stick = "pau"
    case foot = "pe"
    case catch_ = "pega"
    case black = "preto"
    case yard = "quintal"
    case tail = "rabo"
    case shallow = "raso"
    case dry = "secar"
    case saw = "serrar"
    case your = "seu"
    case sun = "sol"
    case so = "tao"
    case forehead = "testa"
    case go = "vai"
    case back = "volta"
    case flight = "voo"
    case iGo = "vou"

    case bout = "bota" // Falta
    case pig = "pig"// Falta
    case breaststroke = "Bruços"// Falta
    case six = "seix"// Falta
    case iam = "sou"// Falta
    case room = "quarto"//Falta
    
    var name: String {
        return self.rawValue
    }
}
