module.exports = {
  /**
   * Application configuration section
   * http://pm2.keymetrics.io/docs/usage/application-declaration/
   */
  apps: [
    // First application
    {
      name: 'SnappyDocs',
      script: 'server.js',
      instances: 0,
      exec_mode: 'cluster',
      env: {},
      env_production: {
        NODE_ENV: 'production',
      },
    },
  ],

  /**
   * Deployment section
   * http://pm2.keymetrics.io/docs/usage/deployment/
   */
  deploy: {
    production: {
      user: 'cc',
      host: ['10.1.12.120'],
      ref: 'origin/master',
      repo: 'git@github.com:sonhgc00016/slate.git',
      path: '/home/cc/snappy-docs',
      'post-deploy':
        'export PATH=$PATH:/home/v2/.nvm/versions/node/v10.15.1/bin && yarn && pm2 startOrRestart ecosystem.config.js --env production',
    },
  },
};
