//
//  ContentView.swift
//  Blockchain
//
//  Created by Jorge Giannotta on 22/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var from: String = "The School"
    @State var to: String = ""
    @State var certificate: String = ""
    @State var arrayBC = ["Genesis Block"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            Image("18514975")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
            
            TextField("Type From New Block", text: $from)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
                .padding(.top, 5)
            
            TextField("Type To New Block", text: $to)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
                .padding(.top, 5)
            
            TextField("Type Certificate New Block", text: $certificate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing,.bottom])
                .padding(.top, 5)
            
            Button(action: {
                text = "From: \(from), To: \(to), Certificate: \(certificate)"
                
                if(!certificate.isEmpty && !from.isEmpty && !to.isEmpty) {
                    arrayBC.append(text)
                    
                    from = ""
                    to = ""
                    certificate = ""
                }
                
            }, label: {
                Text("Add Block to BlockChain")
                    .foregroundColor(.green)
                    .font(.title3)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.black)
                    )
            })
            ScrollView(.vertical, showsIndicators: false, content: {
                ForEach(0 ..< arrayBC.count, id: \.self) { i in
                    Text("\(arrayBC[i])")
                        .padding(.top)
                }
            })
            
            
        })
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
