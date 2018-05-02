import Vapor

var services = Services.default()

let middlewares = MiddlewareConfig()
services.register(middlewares)

let serverConfig = EngineServerConfig.default(hostname: "127.0.0.1", port: 8000)
services.register(serverConfig)

let router = EngineRouter.default()
router.get("ping") { req in
    return "123" as StaticString
}
services.register(router, as: Router.self)

let app = try Application(config: .default(), environment: .detect(), services: services)
try app.run()
