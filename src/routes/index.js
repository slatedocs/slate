const express = require('express');
const router = express.Router();
const {areIp4sInCidrs} = require('../common/ip');
const { BLACKLISTED_CIDRS } = require('../common/config');

const defaultTitle = 'Quadency | Advanced Cryptocurrency Trading Platform';
const defaultDescription = '🚀 Quadency is a single, secure, and easy-to-use interface for advanced trading of all your crypto assets. Access all your exchange accounts from one place with real-time portfolio analysis tools and smarter dashboards so you can start trading like a pro.';

/* GET home page. */
router.get('/', function (req, res) {
  res.render('home', {title: defaultTitle, description: defaultDescription});
});

router.get('/ph', function (req, res) {
  const agentString = req.get('User-Agent');
  const referrer = req.get('Referrer');
  if ((referrer && referrer.includes('art.vpn.twttr.com/tweet_review')) || (agentString && agentString.includes('AdsBot'))) {
    res.render('bots/honeypot');
  } else {
    res.redirect('https://www.producthunt.com/posts/quadency');
  }
});

router.get('/reddit', function (req, res) {
  res.render('bots/honeypot');
});

router.get('/facebook', function (req, res) {
  const clientIps = req.headers['x-forwarded-for'];
  const userAgent = req.headers['user-agent'];
  if(!clientIps || userAgent.includes('facebookexternalhit')){
    res.render('bots/honeypot');
    return;
  }
  const ipMatchCidrs = areIp4sInCidrs(clientIps.split(','), BLACKLISTED_CIDRS);
  if (ipMatchCidrs) {
    res.render('bots/honeypot');
    return
  }

  const path = req.url.split('?');
  const queryString = path.length > 1 ? `?${path[1]}` : '';
  res.redirect(301, `/${queryString}`);
});

router.get('/about', function (req, res) {
  res.render('about');
});

router.get('/pricing', function (req, res) {
  res.render('pricing');
});

router.get('/referrals', function (req, res) {
  res.render('referrals');
});

router.get('/institutional', function (req, res) {
  res.render('institutional');
});

router.get('/privacy-policy', function (req, res) {
  res.render('legal/privacy-policy');
});

router.get('/terms-of-use', function (req, res) {
  res.render('legal/terms-of-use');
});

module.exports = router;
