//
//  ContentView.swift
//  BooksDiscovery
//
//  Created by Alexey on 25.02.2020.
//  Copyright © 2020 GETMOBIT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State var discoveryBooks = [Doc]()
	@State var discoveryBook: String = ""
	var books = [Doc]()

    var body: some View {
        
		List {
			HStack {

				TextField("input to discovery", text: $discoveryBook)
				
				Spacer()
				Button (action: {

					DocsAPI.searchDocs(title: self.discoveryBook) { list, error in
						if let docs = list?.docs {
							
							self.discoveryBooks = docs
		
						}
					}
					}) {
						Text("search") .foregroundColor(.blue)
					}
			}
			
		}
	
			
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
