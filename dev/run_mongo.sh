docker run -d \
		-p '27017-27019:27017-27019' \
		-v $(pwd)/init-mongo.js:/docker-entrypoint-initdb.d/init-mongo.js \
		-v $(pwd)/mongo/data:/data/db \
		-e MONGO_INITDB_DATABASE=green_berlin_dev \
		-e MONGO_INITDB_ROOT_USERNAME=root \
		-e MONGO_INITDB_ROOT_PASSWORD=root_pass \
		mongo
