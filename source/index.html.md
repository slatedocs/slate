---
title: API Reference
language_tabs: # must be one of https://git.io/vQNgJ
  - json

toc_footers:
  - <a href='https://cubobit.com/signup'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes: # api - group - category - call
  - background/api_bkg_background

  - users/api_users_divider
  - users/api_users_auth_authenticateuser
  - users/api_users_user_canceluserreport
  - users/api_users_user_getuseraccountinfos
  - users/api_users_user_getuseraccounts
  - users/api_users_user_getuseraffiliatecount
  - users/api_users_user_getuseraffiliatetag
  - users/api_users_user_getuserreporttickets
  - users/api_users_user_subscribeaccountevents
  - users/api_users_auth_logout

  - accounts/api_accts_divider
  - accounts/api_accts_user_generatetradeactivityreport
  - accounts/api_accts_user_generatetransactionactivityreport
  - accounts/api_accts_user_generatetreasuryactivityreport
  - accounts/api_accts_user_getaccountinfo
  - accounts/api_accts_user_getaccountpositions
  - accounts/api_accts_user_scheduletradeactivityreport
  - accounts/api_accts_user_scheduletransactionactivityreport
  - accounts/api_accts_user_scheduletreasuryactivityreport

  - trades/api_trades_divider
  - trades/api_trades_user_getaccounttrades
  - trades/api_trades_user_getaccounttransactions
  - trades/api_trades_user_getopentradereports
  - trades/api_trades_user_gettickerhistory
  - trades/api_trades_user_gettradeshistory

  - markets/api_markets_divider
  - markets/api_users_user_getl2snapshot
  - markets/api_users_user_getlevel1
  - markets/api_users_user_subscribelevel1
  - markets/api_users_user_subscribelevel2
  - markets/api_users_user_subscribeticker
  - markets/api_users_user_subscribetrades
  - markets/api_users_user_unsubscribelevel1
  - markets/api_users_user_unsubscribelevel2
  - markets/api_users_user_unsubscribeticker
  - markets/api_users_user_unsubscribetrades


  - oms_orders/api_omsord_divider
  - oms_orders/api_omsord_user_cancelallorders
  - oms_orders/api_omsord_user_cancelorder
  - oms_orders/api_omsord_user_cancelquote
  - oms_orders/api_omsord_user_cancelreplaceorder
  - oms_orders/api_omsord_user_createquote
  - oms_orders/api_omsord_user_getopenorders
  - oms_orders/api_omsord_user_getorderfee
  - oms_orders/api_omsord_user_getorderhistory
  - oms_orders/api_omsord_user_getorderhistorybyorderid
  - oms_orders/api_omsord_user_getordershistory
  - oms_orders/api_omsord_user_modifyorder
  - oms_orders/api_omsord_user_sendorder

  - products/api_products_divider
  - products/api_prods_user_getproduct
  - products/api_prods_user_getproducts

  - instrs/api_instrs_divider
  - instrs/api_instrs_user_getinstrument
  - instrs/api_instrs_user_getinstruments

  - packages/api_packages_divider
  - packages/api_packages_node

search: true
---

# Introduction

The cubobit Exchange (cubobit)  is a high-performance exchange technology built for blockchain, which is based on RPC over WebSockets.
