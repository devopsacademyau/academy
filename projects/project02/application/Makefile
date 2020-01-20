
prepare:
	cd api \
	&& pip3 install virtualenv \
	&& python3 -m venv venv
	cd web && yarn install
	
run_api: prepare
	( cd api; \
	. ./venv/bin/activate; \
	pip install -r requirements.txt; \
	python app.py; \
	)
	
run_web: prepare
	cd web && yarn start
	
package:
	cd web && npm run build
	 
clean:
	cd web && rm -rf node_modules
	