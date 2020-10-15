db.createUser({
	user: 	"ingest",
	pwd: 	"fPyRA2yT2vIfVvBWBQMhUnnmrqBO1nwK",
	roles: 	[
		{
			role: 	"readWrite",
			db: 	"green_berlin"
		}
	]
})

db.createUser({
	user: 	"api",
	pwd: 	"yj7ZafiDPUN27QacNcHkLwBxgCpWV0GN",
	roles: 	[
		{
			role: 	"readWrite",
			db: 	"green_berlin"
		}
	]
})
