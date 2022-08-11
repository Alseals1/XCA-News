import Foundation

enum MenuItem: CaseIterable {
    case search
    case saved
    case category(Category)
    #if os(watchOS)
    case setting
    #endif
    
    
    var text: String {
        switch self {
        case .search:
            return "Search"
        case .saved:
            return "Saved"
        case .category(let category):
            return category.text
        #if os(watchOS)
        case .setting:
            return "Setting"
        #endif

        }
    }
    
    var systemImage: String {
        switch self {
        case .search:
            return "magnifyingglass"
        case .saved:
            return "bookmark"
        case .category(let category):
            return category.systemImage
        #if os(watchOS)
        case .setting:
            return "gear"
        #endif
        }
    }
    
    static var allCases: [MenuItem] {
        return [.search, .saved] + Category.menuItems
    }
    
}

extension MenuItem: Identifiable {
    
    var id: String {
        switch self {
        case .search:
            return "search"
        case .saved:
            return "saved"
        case .category(let category):
            return category.rawValue
        #if os(watchOS)
        case .setting:
            return "Setting"
        #endif
        }
    }
    
    init?(id: MenuItem.ID?) {
        switch id {
        case MenuItem.search.id:
            self = .search
        case MenuItem.saved.id:
            self = .saved
        #if os(watchOS)
        case MenuItem.setting.id:
            self = .setting
            #endif
        default:
            if let id = id, let category = Category(rawValue: id) {
                self = .category(category)
            } else {
                return nil
            }
        }
    }
    
}

extension Category {
    static var menuItems: [MenuItem] {
        allCases.map { .category($0) }
    }
}
