import Foundation

struct Trip: Identifiable, Codable {
    let id: Int
    let trip_text: String
    let created_date: String
}
