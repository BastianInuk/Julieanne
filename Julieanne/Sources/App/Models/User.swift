import FluentSQLite
import Vapor

struct User: Codable {
    var id: Int?
    var username: String
    var mail: String
    var password: String
}

/// Makes it so `User` has a table in SQLite - For testing purpose!
extension User: SQLiteModel {}

/// Allows `User` to be encoded to and decoded from HTTP messages.
extension User: Content { }
