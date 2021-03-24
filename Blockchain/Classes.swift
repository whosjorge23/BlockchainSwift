//
//  Classes.swift
//  Blockchain
//
//  Created by Jorge Giannotta on 24/03/21.
//

import Foundation

// CREATE BLOCK CLASS

class Block {
    
    var hash = String()
    var data = String()
    var prevHash = String()
    var index = Int()
    
    func createHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
    
}

// CREATE A BLOCKCHAIN CLASS

class BlockChain {
    
    var chain = [Block]()
    
    func createGenesisBlock(data: String) {
        let gBlock = Block()
        gBlock.hash = gBlock.createHash()
        gBlock.data = data
        gBlock.prevHash = "nil - Genesis Block"
        gBlock.index = 0
        
        chain.append(gBlock)
    }
    
    func addBlock(data: String) {
        let newBlock = Block()
        newBlock.hash = newBlock.createHash()
        newBlock.data = data
        newBlock.prevHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        
        chain.append(newBlock)
    }
}

// CREATE CHAIN

let englishCetificate = BlockChain()
