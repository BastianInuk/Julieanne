import Vapor
import Crypto

/// `User` routes, this includes authentication
final class UserController: RouteCollection {
    func boot(router: Router) throws {
        // Makes it so /api/users is the route in this controller.
        let usersRoute = router.grouped("api", "users")
            
            usersRoute.get(User.parameter, use: getHandler)
        
            usersRoute.post(User.self, use: createHandler)
        
        /// Protected route, only for authenticated `User`s
        let basicAuthMiddleware = User.basicAuthMiddleware(using: BCryptDigest())
        let basicAuthGroup = usersRoute.grouped(basicAuthMiddleware)
            basicAuthGroup.post("login", use: loginHandler)

        let tokenAuthMiddleware = User.tokenAuthMiddleware()
        let guardAuthMiddleware = User.guardAuthMiddleware()
        let tokenAuthGroup = usersRoute.grouped(tokenAuthMiddleware, guardAuthMiddleware)
        
            tokenAuthGroup.get(use: getAllHandler)
    }
    
    func createHandler(_ req: Request, user: User) throws -> Future<User.Public> {
      user.password = try BCrypt.hash(user.password)
      return user.save(on: req).convertToPublic()
    }

    func getAllHandler(_ req: Request) throws -> Future<[User.Public]> {
      return User.query(on: req).decode(data: User.Public.self).all()
    }

    func getHandler(_ req: Request) throws -> Future<User.Public> {
      return try req.parameters.next(User.self).convertToPublic()
    }

    func loginHandler(_ req: Request) throws -> Future<Token> {
      let user = try req.requireAuthenticated(User.self)
      let token = try Token.generate(for: user)
      return token.save(on: req)
    }
}
