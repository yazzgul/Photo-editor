import Foundation

struct MyImage: Identifiable, Codable {
    var id = UUID()
    var name: String
}
