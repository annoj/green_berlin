db.createUser({
	user: 	"admin",
	pwd: 	"mongo_admin_pass",
	roles: 	[
		{
			role: 	"readWrite",
			db: 	"green_berlin_dev"
		}
	]
})

db.createUser({
	user: 	"test_data",
	pwd: 	"test_data_pass",
	roles: 	[
		{
			role: 	"readWrite",
			db: 	"green_berlin_dev"
		}
	]
})
