//
//  settingsScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI
import MapKit

struct Found: View {
    
    @ObservedObject var newFoundObject: foundObject = foundObject()
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                
                Text("Great! Tell us What You Found")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.top, 100)
                
                Spacer(minLength: 200)
                
                HStack{
                    VStack{
                        /*
                         Maybe implement a map later? may be extraneous
                         Map{}
                         .frame(width: 250, height: 250)
                         .mapControlVisibility(.visible)
                         */
                        HStack{
                            Text("Title:")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Give the Item a Title.", text: $newFoundObject.title, axis: .vertical)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        HStack{
                            Text("Associated Name:")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("If a Name can be Given, put it Here.", text: $newFoundObject.associatedName, axis: .vertical)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        HStack{
                            Text("Description:")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Please be as Descriptive as Possible.", text: $newFoundObject.description, axis: .vertical)
                                .lineLimit(5, reservesSpace: true)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                                Spacer()
                        }
                        HStack{
                            Text("Found At:")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Where did you Find it?", text: $newFoundObject.foundAt, axis: .vertical)
                                .lineLimit(2, reservesSpace: true)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        HStack{
                            Text("Left At:")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Where did you Leave it?", text: $newFoundObject.leftAt, axis: .vertical)
                                .lineLimit(2, reservesSpace: true)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        Spacer()
                        
                        
                        
                    }
                }
            }
        }
    }
    
}
