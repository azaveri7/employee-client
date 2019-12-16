const PROXY_CONFIG = [
	{
		context: [
			"/api"
		],
		target:http:"//localhost:9090/employee-service",
		secure:false
	}
]

module.exports = PROXY_CONFIG;