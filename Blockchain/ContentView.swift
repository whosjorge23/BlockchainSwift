//
//  ContentView.swift
//  Blockchain
//
//  Created by Jorge Giannotta on 22/03/21.
//

import SwiftUI
import SwiftHEXColors

struct ContentView: View {
    
    @State var text: String = ""
    @State var from: String = "The School"
    @State var to: String = ""
    @State var certificate: String = ""
    //@State var arrayBC = ["Genesis Block"]
    @State var genesisBlock = false
    @State var data = false
    
    @State var isChainValid = true
    @State var invalidHash = ""
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10, content: {
            Image("18514975")
                .resizable()
                .scaledToFit()
//                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .frame(width: 250, height: 250, alignment: .center)
            
            TextField("Type From New Block", text: $from)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
                .padding(.top, 5)
                .foregroundColor(Color(UIColor(hexString: "#83BAFE")!))
                
            TextField("Type To New Block", text: $to)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
                .padding(.top, 5)
                .foregroundColor(Color(UIColor(hexString: "#83BAFE")!))
            
            TextField("Type Certificate New Block", text: $certificate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing,.bottom])
                .padding(.top, 5)
                .foregroundColor(Color(UIColor(hexString: "#83BAFE")!))
            
            Button(action: {
                if genesisBlock == false {
                    englishCetificate.createGenesisBlock(data: "Genesis Block")
                    genesisBlock = true
                }
                text = "From: \(from), To: \(to), Certificate: \(certificate)"
                
                if(!certificate.isEmpty && !from.isEmpty && !to.isEmpty) {
                    //arrayBC.append(text)
                    
                    englishCetificate.addBlock(data: text)
                    from = ""
                    to = ""
                    certificate = ""
                    
                }
                
                data.toggle()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

            }, label: {
                if data == false {
                    Text("Add Block to BlockChain")
                        .foregroundColor(Color(UIColor(hexString: "ECF0F1")!))
                        .font(.title3)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(UIColor(hexString: "559df4")!))
                        )
                }else {
                    Text("Add Block to BlockChain")
                        .foregroundColor(Color(UIColor(hexString: "ECF0F1")!))
                        .font(.title3)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(UIColor(hexString: "559df4")!))
                        )
                }
                
            })
            ScrollView(.vertical, showsIndicators: false, content: {
                ForEach(0 ..< englishCetificate.chain.count, id: \.self) { i in
//                    Text("\(arrayBC[i])")
//                        .padding(.top)
                    Text("\(englishCetificate.chain[i].data)\n\(englishCetificate.chain[i].prevHash)\n\(englishCetificate.chain[i].hash)")
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                        .foregroundColor(Color(UIColor(hexString: "ECF0F1")!))
                        .padding([.leading,.trailing], 20.0)
                    
//                    ForEach(1 ..< englishCetificate.chain.count-1) { i in
//                        if englishCetificate.chain[i].hash != englishCetificate.chain[i-1].prevHash {
//                        Text("Block Not Valid")
//                        }
//                    }
                }
                
            })
            
        })
        .background(Color(UIColor(hexString: "#83BAFE")!))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
