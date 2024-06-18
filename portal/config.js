const Config = {
	alerting: {
		fetchBroadcastUrl: './resources/newsFeedPortalAlerts.json',
	},
	namedProjections: [
		[ 'EPSG:25832', '+title=ETRS89/UTM 32N +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' ],
	],
	layerConf: './resources/services-internet.json',
	restConf: './resources/rest-services-internet.json',
	styleConf: './resources/style_v3.json',
	wfsImgPath: './resources/img/',
	portalLanguage: {
		enabled: true,
		debug: false,
		languages: {
			de: 'Deutsch',
			en: 'English',
			es: 'Español',
			it: 'Italiano',
			platt: 'Platt',
			pt: 'Português',
			ru: 'Русский',
			tr: 'Türkçe',
			ua: 'Українська',
		},
		fallbackLanguage: 'de',
		changeLanguageOnStartWhen: [ 'querystring', 'localStorage', 'htmlTag' ],
	},
}
