import Vapor
import Crypto

/// `User` routes, this includes authentication
final class UserController: RouteCollection {
    func boot(router: Router) throws {
        // Makes it so /api/users is the route in this controller.
        let usersRoute = router.grouped("api", "users")
        
    }
}
