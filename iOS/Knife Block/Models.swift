import Foundation

struct Knife: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var maker: String
    var steel: String
    var notes: String
    var dateAdded: Date = Date()
}
