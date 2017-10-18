all: sass

sass:
	sass assets/sass/main.scss assets/css/main.css
	sass assets/sass/ie8.scss assets/css/ie8.css

serve:
	python -m http.server
