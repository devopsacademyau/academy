
prepare:
	cd api \
	&& pip3 install virtualenv \
	&& python3 -m venv venv
	cd web && yarn install
	
run_api:
	( cd api; \
	. ./venv/bin/activate; \
	pip install -r requirements.txt; \
	python app.py; \
	)
	
run_web:
	cd web && yarn start
	
package:
	cd web && npm run build
	 
clean:
	cd web && rm -rf node_modules
	