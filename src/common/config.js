const ENVIRONMENT = process.env.ENVIRONMENT || 'development';
let BASE_URL;

switch (ENVIRONMENT) {
  case 'development':
    BASE_URL = 'http://quadency.net';
    break;
  case 'staging':
    BASE_URL = 'https://staging.quadency.com';
    break;
  case 'production':
    BASE_URL = 'https://quadency.com';
    break;
  default:
    break;
}

exports.ENVIRONMENT = ENVIRONMENT;
exports.BASE_URL = BASE_URL;
