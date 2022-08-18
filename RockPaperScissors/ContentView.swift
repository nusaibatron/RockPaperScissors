//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nusaiba Rahman on 8/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user_tool: String = "Scissors"
    @State private var computer_tool: String = ""
    @State var youWin = false
    
    enum Players{ case user, computer}

    var tools: [String] = ["Rock", "Paper", "Scissors"]
    
    var return_computer_tool: String {
        return computer_tool
    }
    
    var return_winner: String {
        
        if youWin {
            return "You Win!"
        }
        else {
            return "Computer Wins"
            
        }
    }
    
    func updateComputerTool() -> Void {
        var selectedTool = tools.randomElement()
        computer_tool = selectedTool!
        calculateWinner()

        
    }
    
    func calculateWinner() -> Void {
        if (computer_tool == "Paper" && user_tool == "Rock")
        {
            youWin = false
        }
        
        else
        { youWin = true }
    }
    
    
    
    var body: some View {
        
        NavigationView {
        Form {
            Section {
                Picker("User Tool", selection: $user_tool) {
                    ForEach(tools, id: \.self) {
                        Text($0)
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Choose your tool")
            }
            
            
            Button("Let's play", action: updateComputerTool)
            
            
            Section {
                Text("Computer chose: \(return_computer_tool) ")
            }
            Section {
                Text("Looks like: \(return_winner) ")
            }
        } .navigationTitle( "Rock Paper Scissors!")
    }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
