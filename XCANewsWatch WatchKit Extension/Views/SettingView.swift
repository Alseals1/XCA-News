//
//  SettingView.swift
//  XCANewsWatch WatchKit Extension
//
//  Created by Alandis Seals on 8/10/22.
//

import SwiftUI

let complicationCategoryKey = "selected_complication_category"


struct SettingView: View {
    @EnvironmentObject private var bookmarkVM: ArticleBookmarkViewModel
    @AppStorage(complicationCategoryKey) private var _selectedCategory: String?
    
    private var selectedCategory: Binding<Category> {
        Binding {
            Category(rawValue: _selectedCategory ?? Category.general.rawValue) ?? .general
        } set: { newValue in
            _selectedCategory = newValue.rawValue
        }
    }
    
    
    
    var body: some View {
        Form {
            Section {
                Picker("Category", selection: selectedCategory) {
                    ForEach(Category.allCases) {
                        Text($0.text).tag($0)
                    }
                }
            } header: {
                Text("Complication")
            } footer: {
                Text("Set category of news used for refreshing complication data")
            }
            
            if !bookmarkVM.bookmarks.isEmpty {
                Section {
                    Button(role: .destructive) {
                        bookmarkVM.removeAllBookmarks()
                    } label: {
                        Text("Clear All")
                    }
                    
                } header: {
                    Text("Saved bookmarks data")
                } footer: {
                    Text("Clearing will remove all your saved articles list data")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(ArticleBookmarkViewModel.shared)
    }
}
